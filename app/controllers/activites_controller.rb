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
        format.html { redirect_to user_path(current_user), notice: 'Activite was successfully created.' }
        format.json { render json: @activite, status: :created, location: @activite }
      else
        format.html { render action: "new" }
        format.json { render json: @activite.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @activite = Activite.find(params[:id])

    respond_to do |format|
      if @activite.update_attributes(params[:activite])
        format.html { redirect_to activites_path, notice: 'Pesee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activite.errors, status: :unprocessable_entity }
      end
    end
  end


end
