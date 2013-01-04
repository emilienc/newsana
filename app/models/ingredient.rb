class Ingredient < ActiveRecord::Base
  attr_accessible :aliment_id, :quantite, :repa_id
  validates_presence_of :aliment_id, :quantite
  belongs_to :aliment
  belongs_to :repa

  def calories
  	#en Kcal
  	(quantite.to_f * aliment.calories)
  end

end
