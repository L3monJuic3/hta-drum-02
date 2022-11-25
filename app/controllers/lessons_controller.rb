class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[show update destroy]
  def index
    @lessons = Lesson.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.host.id == current_user && @lesson.save
      redirect_to lesson_path(@lesson)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @lesson.destroy
    redirect_to lessons_path, status: :see_other
  end


  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:name, :category, :description, :price, :prepare_time, :photo)
  end

end

# each lesson should have its fields shown on html
# host should be able to update the lessons price
# host host should be able to create a new lesson 'package'
# users can only see the index and show
