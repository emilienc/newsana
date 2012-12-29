class Profile < ActiveRecord::Base
  attr_accessible :age, :poids, :taille, :user_id
  belongs_to :user
end
