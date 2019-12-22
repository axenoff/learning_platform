# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ApplicationRecord
  has_many :groups, dependent: :destroy

  scope :sorted_by_date_start, lambda {
    joins("left join groups on groups.course_id = courses.id")
      .select("courses.*, min(groups.date_start) AS min_date_start")
      .where('groups.date_finish > ?', Date.current)
      .group('courses.id')
      .order('min_date_start ASC')
  }

  def upcoming_group_start
    upcoming_group.date_start.to_date
  end

  def upcoming_group_students_number
    upcoming_group.students.count
  end

  def upcoming_group
    groups.future.first
  end
end
