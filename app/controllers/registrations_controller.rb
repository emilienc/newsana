class RegistrationsController < Devise::RegistrationsController



def update
    params[:user][:guest] = false
    super
end


  def create
  @user = params[:user] ? User.new(params[:user]) : User.new_guest
  if @user.guest?
    @user.name = "Anonyme"
    @user.password = "password"
  	@user.save
  	set_flash_message :notice, :signed_up if is_navigational_format?
    sign_in(@user)
    respond_with @user, :location => after_sign_up_path_for(@user)
  else
  #	session[:user_id] = @user.id
  #	redirect_to after_update_path_for(@user)
  #else 
  	super
  end
end



  protected

    def after_update_path_for(resource)
      user_path(resource)
    end
end
