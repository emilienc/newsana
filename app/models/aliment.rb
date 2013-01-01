class Aliment < ActiveRecord::Base
  attr_accessible :calories, :glucides, :lipides, :name, :proteines, :quantite, :unite
  has_and_belongs_to_many :repas
end
