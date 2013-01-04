class UsersController < ApplicationController
  #before_filter :authenticate_user!
  #load_and_authorize_resource :only => :index

  #Rails index method is provided by default


  def apport_calorique(repas)
    @calrep = 0
    #on fait la somme des calories acquises ce jour
    repas.each do |r|
        @calrep += r.calories
    end
    @calrep
  end


  def depense_calorique(activites,user)
    #on fait la somme des calories dépensées ce jour
    @calact = 0
    #on fait la somme des calories dépensées ce jour
    activites.each do |a|
        @calact += a.calories
    end
    #on ajoute le metabolisme
    @calact += Doctor.metabolisme(user)
  end

  def show

    #on presente 2 courbes : 
    #la dépense = metabolisme + activite du jour
    #les calories qu'on a apporté = repas



    @dates = (Date.today-7..Date.today).map { |p| p.to_s }
    @calories_depense = []
    @calories_acquise = []
    @besoins = []
    @metabolismes = []
    @user = User.find(params[:id])
    unless @user.profile.nil? || @user.profile.uncomplete?
      (Date.today-7..Date.today).each do |quand|
        @repas = current_user.repas.find_all_by_quand(quand)
        @activites = current_user.activites.find_all_by_quand(quand)
        @calories_depense << depense_calorique(@activites,@user).round
        @calories_acquise << apport_calorique(@repas).round
        @metabolismes << Doctor.metabolisme(@user).round
        @besoins << Doctor.besoin_quotidien(@user).round
      end
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
