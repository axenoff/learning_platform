class CoursesController < ApplicationController
  def index
    @courses = params[:sort] == 'by_date' ? Course.sorted_by_date_start : Course.all
  end

  def show
    @course = Course.find(params[:id])
  end
end
