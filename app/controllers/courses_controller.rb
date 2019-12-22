class CoursesController < ApplicationController
  def index
    @courses = params[:sort] == 'by_date' ? Course.sorted_by_date_start : Course.sorted_by_name
  end

  def show
    @course = Course.find(params[:id])
  end
end
