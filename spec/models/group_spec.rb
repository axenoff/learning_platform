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

require 'rails_helper'

RSpec.describe Group, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
