class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_user_language
  


  def after_sign_in_path_for(resource)
  	user_path(resource)
  end

  def default_url_options(options={})
  	logger.debug "default_url_options is passed options: #{options.inspect}\n"
  	{ :locale => I18n.locale }
  end
  
  def set_user_language
  	I18n.locale = params[:locale] || I18n.default_locale
  end
 
  def authenticate_admin_user!
   authenticate_user!
   unless current_user.admin?
    flash[:alert] = "This area is restricted to administrators only."
    redirect_to root_path
   end
 end
 
 def current_admin_user
  return nil if user_signed_in? && !current_user.admin?
  current_user
 end


end
