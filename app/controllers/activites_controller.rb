# encoding: UTF-8
class ActivitesController < ApplicationController


def new
	@activite = Activite.new
	respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activite}
    end
end


def edit
	@activite = Activite.find(params[:id])
end

def index
    @activites = current_user.activites

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pesees }
    end
  end


 def create
    @activite = Activite.create(params[:activite])

    respond_to do |format|
      if @activite.save
        format.html { redirect_to activites_path, notice: 'Activite was successfully created.' }
        format.json { render json: @activite, status: :created, location: @activite }
      else
        format.html { render action: "new" }
        format.json { render json: @activite.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @activite = Activite.find(params[:id])
    
    if params[:destroy]
       @result = @activite.destroy
       @notice = 'Activite was successfully deleted.' 
    else
       @result = @activite.update_attributes(params[:activite])
       @notice = 'Activite was successfully updated.' 
    end

      respond_to do |format|
        if @result
          format.html { redirect_to activites_path, notice: @notice }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @activite.errors, status: :unprocessable_entity }
        end
      end
  end

end
