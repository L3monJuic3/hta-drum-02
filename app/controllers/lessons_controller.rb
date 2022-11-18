class LessonsController < ApplicationController
  def index
    @lesson = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:lesson_id])
  end



  private

  def lesson_params
    params.require(:lesson).permit(:name, :category, :description, :price, :prepare_time, :photo)
  end

end
