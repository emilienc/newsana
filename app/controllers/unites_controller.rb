class UnitesController < ApplicationController
  # GET /unites
  # GET /unites.json
  def index
    @unites = Unite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unites }
    end
  end

  # GET /unites/1
  # GET /unites/1.json
  def show
    @unite = Unite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unite }
    end
  end

  # GET /unites/new
  # GET /unites/new.json
  def new
    @unite = Unite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unite }
    end
  end

  # GET /unites/1/edit
  def edit
    @unite = Unite.find(params[:id])
  end

  # POST /unites
  # POST /unites.json
  def create
    @unite = Unite.new(params[:unite])

    respond_to do |format|
      if @unite.save
        format.html { redirect_to @unite, notice: 'Unite was successfully created.' }
        format.json { render json: @unite, status: :created, location: @unite }
      else
        format.html { render action: "new" }
        format.json { render json: @unite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unites/1
  # PUT /unites/1.json
  def update
    @unite = Unite.find(params[:id])

    respond_to do |format|
      if @unite.update_attributes(params[:unite])
        format.html { redirect_to @unite, notice: 'Unite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unites/1
  # DELETE /unites/1.json
  def destroy
    @unite = Unite.find(params[:id])
    @unite.destroy

    respond_to do |format|
      format.html { redirect_to unites_url }
      format.json { head :no_content }
    end
  end
end
