# encoding: UTF-8
class RepasController < ApplicationController
  # GET /repas
  # GET /repas.json
  def index
    
    @repas = current_user.repas

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @repas }
    end
  end

  # GET /repas/1
  # GET /repas/1.json
  def show
    @repa = Repa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @repa }
    end
  end

  # GET /repas/new
  # GET /repas/new.json
  def new
    @aliments = Aliment.all
    @repa = Repa.new
    @ingredient = @repa.ingredients.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @repa }
    end
  end

  # GET /repas/1/edit
  def edit
    @aliments = Aliment.all
    @repa = Repa.find(params[:id])
  end

  # POST /repas
  # POST /repas.json
  def create
    @repa = Repa.new(params[:repa])

    respond_to do |format|
      if @repa.save
        format.html { redirect_to @repa, notice: 'Repa was successfully created.' }
        format.json { render json: @repa, status: :created, location: @repa }
      else
        format.html { render action: "new" }
        format.json { render json: @repa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /repas/1
  # PUT /repas/1.json
  def update
    @repa = Repa.find(params[:id])

    if params[:destroy]
       @result = @repa.destroy
       @notice = 'Ce repas a été supprimée avec succés.'
    else
       @result = @repa.update_attributes(params[:repa])
       @notice = 'Cette pesée a été modifiée avec succés.'
    end


    respond_to do |format|
      if @result
        format.html { redirect_to @repa, notice: @notice }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @repa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repas/1
  # DELETE /repas/1.json
  def destroy
    @repa = Repa.find(params[:id])
    @repa.destroy

    respond_to do |format|
      format.html { redirect_to repas_url }
      format.json { head :no_content }
    end
  end
end
