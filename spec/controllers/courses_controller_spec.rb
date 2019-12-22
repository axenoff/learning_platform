require 'rails_helper'

describe CoursesController, type: :controller do
  let!(:course) { create :course, name: 'A', description: 'AA' }

  describe 'GET index' do
    it 'return successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET show' do
    it 'return successful response' do
      get :show, params: { id: course.id }
      expect(response).to have_http_status(:success)
    end
  end
end