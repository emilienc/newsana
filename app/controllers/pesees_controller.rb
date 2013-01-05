# encoding: UTF-8
class PeseesController < ApplicationController
  # GET /pesees
  # GET /pesees.json
  def index
    @pesees = current_user.pesees

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
    @pesee = Pesee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pesee }
    end
  end

  # GET /pesees/1/edit
  def edit
    @pesee = Pesee.find(params[:id])
  end

  # POST /pesees
  # POST /pesees.json
  def create
    @pesee = Pesee.create(params[:pesee])

    respond_to do |format|
      if @pesee.save
        format.html { redirect_to user_path(current_user), notice: 'Votre nouveau poids a été enregistré avec succés.' }
        format.json { render json: @pesee, status: :created, location: @pesee }
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

    if params[:destroy]
       @result = @pesee.destroy
       @notice = 'Cette pesée a été supprimée avec succés.'
    else
       @result = @pesee.update_attributes(params[:pesee])
       @notice = 'Cette pesée a été modifiée avec succés.'
    end

    respond_to do |format|
      if @result
        format.html { redirect_to pesees_path, notice: @notice }
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
      format.html { redirect_to pesees_path }
      format.json { head :no_content }
    end
  end
end
