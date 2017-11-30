class DashboardController < ApplicationController
  def index
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
