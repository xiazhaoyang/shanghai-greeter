class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
     params[:user][:interest_list] = params[:user][:interest_array].join(',') if params[:action] == 'update'
     params[:user].delete(:interest_array) if params[:action] == 'update'

     # For additional in app/views/devise/registrations/edit.html.erb
     devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number, :wechat_id, :language, :bio, :interest_list ])
   end

end
