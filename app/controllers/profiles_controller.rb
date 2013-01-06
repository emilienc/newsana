# encoding: UTF-8
class ProfilesController < ApplicationController
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @user = User.find(params[:user_id])
    @user.build_profile if @user.profile.nil?
    @profile = @user.profile

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @user = User.find(params[:user_id])
    @user.build_profile if @user.profile.nil?
    @profile = @user.profile
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @user = User.find(params[:user_id])
    @user.build_profile(params[:profile])

    respond_to do |format|
      if @user.profile.save
        format.html { redirect_to user_path(@user.id), notice: 'Votre profil a bien été créé.' }
        format.json { render json: @user.profile, status: :created, location: @user.profile }
      else
        format.html { render action: "new" }
        format.json { render json: @user.profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @user = User.find(params[:user_id])
    @user.profile = Profile.find(params[:id])

    respond_to do |format|
      if @user.profile.update_attributes(params[:profile])
        format.html { redirect_to user_path(@user.id), notice: 'Votre profil a bien été modifié.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to home_url }
      format.json { head :no_content }
    end
  end
end
