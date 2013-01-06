# encoding: UTF-8
class TargetsController < InheritedResources::Base

def new
    @user = User.find(params[:user_id])
    @user.build_target if @user.target.nil?
    @target = @user.target

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @target }
    end
  end


  def edit
    @user = User.find(params[:user_id])
    @user.build_target if @user.target.nil?
    @target = @user.target
  end

  def create
    @user = User.find(params[:user_id])
    @user.build_target(params[:target])

    respond_to do |format|
      if @user.target.save
        format.html { redirect_to user_path(@user.id), notice: 'Votre objectif a bien été enregistré.' }
        format.json { render json: @user.target, status: :created, location: @user.target}
      else
        format.html { render action: "new" }
        format.json { render json: @user.target.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:user_id])
    @user.target = Target.find(params[:id])

    respond_to do |format|
      if @user.target.update_attributes(params[:target])
        format.html { redirect_to user_path(@user.id), notice: 'Votre objectif a bien été enregistré.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.target.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
    @target = Target.find(params[:id])
    @target.destroy

    respond_to do |format|
      format.html { redirect_to home_url }
      format.json { head :no_content }
    end
  end


end
