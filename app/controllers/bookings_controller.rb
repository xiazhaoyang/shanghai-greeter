class BookingsController < ApplicationController
  def index
    @visitor = current_user
    @my_bookings = @visitor.visiting_bookings
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    @booking.save
    redirect_to dashboard_path
  end

  def new
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.new
    @booking.visitor = current_user
  end

  def create
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.new(booking_params)
    @booking.experience = @experience
    @booking.visitor = current_user
    if @booking.date >= (Date.today + 5)
      @booking.save
        redirect_to bookings_path, notice: "Booking confirmed!"
    else
      redirect_to experience_path(@experience), alert: "I am sorry, these dates are unavailable or are not valid."
    end
  end

  # def edit
  #   @booking = Booking.find(params[:id])
  # end

  # def update
  #   @booking = Booking.find(params[:id])
  #   @booking.update(booking_params)
  #   redirect_to dashboard_visitor_path, notice: "Booking updated!"
  # end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, notice: "Booking has been cancelled!"
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :aasm_state)
  end

end
