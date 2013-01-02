class Ingredient < ActiveRecord::Base
  attr_accessible :aliment_id, :quantite
  has_one :aliment
  belongs_to :repa
end
