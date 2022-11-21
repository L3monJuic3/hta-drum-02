class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show]

  def index
    @lesson = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user = current_user
    if @user.save!
      current_user.save
      redirect_to new_lesson_booking_path(@lesson.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :category, :description, :price, :prepare_time, :photo)
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
end
