class Ingredient < ActiveRecord::Base
  attr_accessible :aliment_id, :quantite, :repa_id, :aliment_attributes
  validates_presence_of :aliment_id, :quantite
  belongs_to :aliment
  belongs_to :repa

  def calories
  	#en Kcal sachant que les quantités sont remplis en grammes
  	(quantite * aliment.calories)/100.0
  end

end
