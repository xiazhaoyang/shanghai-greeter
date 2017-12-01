class DashboardController < ApplicationController
  def index
    @visitor = current_user
    @my_bookings = @visitor.visiting_bookings
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
