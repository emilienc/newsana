class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_user_language
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end


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
 

end
