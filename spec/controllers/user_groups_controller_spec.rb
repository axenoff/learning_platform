require 'rails_helper'

describe UserGroupsController, type: :controller do
  let(:course) { create :course, name: 'A', description: 'AA' }
  let!(:group) { create :future_group, course: course }
  let(:student) { create :student }

  describe 'POST create' do
    it 'can add existed user to group' do
      post :create, params: {
        course_id: course.id,
        group_id: group.id,
        user_group: {
          email: student.email
        }
      }
      expect(group.students).to match_array [student]
    end

    it 'can create new user and add to group' do
      post :create, params: {
        course_id: course.id,
        group_id: group.id,
        user_group: {
          email: 'new_email@example.com'
        }
      }
      new_user = User.find_by_email('new_email@example.com')
      expect(group.students).to match_array [new_user]
    end
  end
end