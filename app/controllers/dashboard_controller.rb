class DashboardController < ApplicationController
  def index
    @greeter = current_user
    @my_bookings = @greeter.greeting_bookings
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.save
  end

  def greeter
    render :greeter, layout: false
  end

  def settings
    render :settings, layout: false
  end

  def visitor
    render :visitor, layout: false
  end

end

