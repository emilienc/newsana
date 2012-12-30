class Profile < ActiveRecord::Base
  attr_accessible :birthday, :gender, :taille, :user_id, :image_url
  belongs_to :user
end
