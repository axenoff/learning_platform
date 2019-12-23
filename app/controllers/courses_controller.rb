class CoursesController < ApplicationController
  def index
    if params[:sort] == 'by_date'
      @courses = Course.sorted_by_date_start
    else
      @courses = Course.sorted_by_name
    end
  end

  def show
    @course = Course.includes(groups: :users)
      .find(params[:id])
  end
end
