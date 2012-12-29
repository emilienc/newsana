class PeseesController < ApplicationController
  # GET /pesees
  # GET /pesees.json
  def index
    @user = User.find(params[:user_id])
    @pesees = @user.pesees

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pesees }
    end
  end

  # GET /pesees/1
  # GET /pesees/1.json
  def show
    @pesee = Pesee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pesee }
    end
  end

  # GET /pesees/new
  # GET /pesees/new.json
  def new
    #@pesee = Pesee.new
    @user = User.find(params[:user_id])
    @pesee = @user.pesees.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pesee }
    end
  end

  # GET /pesees/1/edit
  def edit
    @user = User.find(params[:user_id])
    @pesee = Pesee.find(params[:id])
  end

  # POST /pesees
  # POST /pesees.json
  def create
    @user = User.find(params[:user_id])
    @pesee = @user.pesees.build(params[:pesee])

    respond_to do |format|
      if @pesee.save
        format.html { redirect_to @user, notice: 'Pesee was successfully created.' }
        format.json { render json: @user, status: :created, location: @pesee }
      else
        format.html { render action: "new" }
        format.json { render json: @pesee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pesees/1
  # PUT /pesees/1.json
  def update
    @pesee = Pesee.find(params[:id])

    respond_to do |format|
      if @pesee.update_attributes(params[:pesee])
        format.html { redirect_to user_pesees_path(@pesee.user.id), notice: 'Pesee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pesee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pesees/1
  # DELETE /pesees/1.json
  def destroy
    @pesee = Pesee.find(params[:id])
    @pesee.destroy

    respond_to do |format|
      format.html { redirect_to user_pesees_url(@pesee.user.id) }
      format.json { head :no_content }
    end
  end
end