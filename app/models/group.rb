# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  date_finish :datetime
#  date_start  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :bigint
#
# Indexes
#
#  index_groups_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#

class Group < ApplicationRecord
  validates :date_finish, presence: true
  validates :date_start, presence: true
  validate :finish_date_after_start_date

  belongs_to :course

  has_many :user_groups
  has_many :users, through: :user_groups

  scope :with_students, ->{ includes(:user_groups).where.not(user_groups: { id: nil }) }
  scope :future, ->{ where('date_start >= ?', Date.current).order(date_start: :asc) }
  scope :current, lambda {
    where('date_start < ? AND date_finish >= ?', Date.current, Date.current)
      .order(date_start: :asc)
  }
  scope :past, ->{ where('date_finish < ?', Date.current).order(date_start: :desc) }

  def finish_date_after_start_date
    return unless date_finish && date_start

    if date_finish < date_start
      errors.add :date_finish, 'must be greater than date_start'
    end
  end

  def students
    users.where(role: :student)
  end

  def teachers
    users.where(role: :teacher)
  end
end
