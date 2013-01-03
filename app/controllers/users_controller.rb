class UsersController < ApplicationController
  #before_filter :authenticate_user!
  #load_and_authorize_resource :only => :index

  #Rails index method is provided by default


  def apport_journalier(repas,activites)

    @calact = 0
    #on fait la somme des calories dépensées ce jour
    activites.each do |a|
        @calact += a.calories
    end
    @calrep = 0
    #on fait la somme des calories acquises ce jour
    repas.each do |r|
        @calrep += r.calories
    end
    @calrep - @calact

  end


  def show
    @dates = (Date.today-10..Date.today).map { |p| p.to_s }
    @calories = []
    @user = User.find(params[:id])

    (Date.today-10..Date.today).each do |quand|
      @repas = current_user.repas.find_all_by_quand(quand)
      @activites = current_user.activites.find_all_by_quand(quand)
      @calories << apport_journalier(@repas,@activites)
    end
  end

  # def update
  #  authorize! :update, @user, :message => 'Not authorized as an administrator.'
  #  @user = User.find(params[:id])
  #  if @user.update_attributes(params[:user], :as => :admin)
  #    redirect_to users_path, :notice => "User updated."
  #  else
  #    redirect_to users_path, :alert => "Unable to update user."
  #  end
  #end

  #def destroy
  #  authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
  #  user = User.find(params[:id])
  #  unless user == current_user
  #    user.destroy
  #    redirect_to users_path, :notice => "User deleted."
  #  else
  #    redirect_to users_path, :notice => "Can't delete yourself."
  #  end
  #end

end
