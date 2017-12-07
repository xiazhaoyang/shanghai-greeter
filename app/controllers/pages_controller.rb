class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :greeter, :about]

  def home
    @top_experiences = Experience.all.limit(3)
  end

  def greeter
  end

  def about
  end
end
