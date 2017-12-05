class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :index

end
