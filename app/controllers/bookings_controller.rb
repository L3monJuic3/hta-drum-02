class BookingsController < ApplicationController
  def user_bookings
    @bookings = Booking.where(user_id: current_user)
    @current_bookings = (@bookings.where(booking_date: [Date.today..Date.today + 1000.days])).ordered
    @past_bookings = (@bookings.where(booking_date: [Date.today - 1000.days..Date.today])).ordered
    @all = @bookings.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking = Booking.find(params[:lesson_id])
    @booking.lesson = @lesson
    @booking.user = current_user
    if @booking.save!
      redirect_to user_bookings_path
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
end
