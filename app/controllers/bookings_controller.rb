class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :checkout]

  def index
    @bookings = Booking.all
    @slots = Slot.all
  end

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
    @lesson = Lesson.find(params[:lesson_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      @booking.slot.update(is_available: false)
      redirect_to lesson_booking_path(@lesson.id, @booking.id), notice: "Booking created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :slot_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

end
