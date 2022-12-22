class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :checkout]

  def new
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @lesson = Lesson.find(params[:lesson_id])
      @slots_available = Slot.available.where(lesson: @lesson)
      # @slots_available.select! { |slot| slot.is_available == true }
      @booking = Booking.new
      # @slots = @activity.slots.where(is_available: true)
      # raise
      # @booking.activity = @activity
    end
  end

  def my_bookings
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @bookings = Booking.where(user_id: current_user.id)
      @lesson = Lesson.where(id: current_user.slots.pluck(:lesson_id).uniq)
    end
  end
  # def user_bookings
  #   @bookings = Booking.where(user_id: current_user)
  #   @current_bookings = (@bookings.where(booking_date: [Date.today..Date.today + 1000.days])).ordered
  #   @past_bookings = (@bookings.where(booking_date: [Date.today - 1000.days..Date.today])).ordered
  #   @all = @bookings.all
  # end

  def create
    @booking = Booking.new(booking_params)
    @booking = Booking.find(params[:lesson_id])
    @booking.lesson = @lesson
    @booking.user = current_user
    if @booking.save!
      @booking.slot.update(is_available: false)
      redirect_to lessson_bookings_path(lesson.id, booking.id)
    else
      render 'lessons/show', status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking_date).permit(:booking)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
