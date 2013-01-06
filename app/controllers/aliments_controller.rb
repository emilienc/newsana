class AlimentsController < ApplicationController
  def index
  	@aliments = Aliment.all
    respond_to do |format|
      format.html
      format.json { render :json => @aliments.map(&:attributes) }
    end
  end
end
