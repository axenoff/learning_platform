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
  has_one :upcoming_group, ->{ future }, class_name: 'Group'

  scope :sorted_by_name, ->{ includes(:upcoming_group).order(name: :asc) }
  scope :sorted_by_date_start, lambda {
    preload(:upcoming_group)
      joins("left join groups on groups.course_id = courses.id")
      .select("courses.*, min(groups.date_start) AS min_date_start")
      .where('groups.date_finish > ?', Date.current)
      .group('courses.id')
      .order('min_date_start ASC')
  }

end
