ActiveAdmin.register Group do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :course_id, :date_start, :date_finish

  form do |f|
    f.inputs do
      f.input :course
      f.input :date_start, as: :datepicker
      f.input :date_finish, as: :datepicker
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:course_id, :date_start, :date_finish, :state]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
