class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[index show new create edit update destroy]
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:lesson_id])
  end

  def new
    @lesson = Lesson.new
  end


  private

  def lesson_params
    params.require(:lesson).permit(:name, :category, :description, :price, :prepare_time, :photo)
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

end

# each lesson should have its fields shown on html
# host should be able to update the lessons price
# host host should be able to create a new lesson 'package'
# users can only see the index and show
