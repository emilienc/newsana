class Ingredient < ActiveRecord::Base
  attr_accessible :aliment_id, :quantite, :repa_id
  belongs_to :aliment
  belongs_to :repa
end
