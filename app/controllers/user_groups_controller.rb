class UserGroupsController < ApplicationController
  def create
    email = params[:user_group][:email]
    group = Group.find(params[:group_id])
    user = User.find_by(email: email) || User.new(student_params(email))
    unless user.valid?
      redirect_to course_path(id: group.course_id)
      return
    end

    user.save!
    UserGroup.create!(user: user, group: group)
    redirect_to course_path(id: group.course_id)
  end

  private
  
  def student_params(email)
    generated_password = SecureRandom.urlsafe_base64(8)
    email = params[:user_group][:email]
    {
      email: email,
      role: :student,
      password: generated_password,
      password_confirmation: generated_password
    }
  end
end
