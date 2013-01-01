class Repa < ActiveRecord::Base
  attr_accessible :name, :user_id, :quand
  belongs_to :user
  has_and_belongs_to_many :aliments
end
