class Repa < ActiveRecord::Base
  attr_accessible :name, :user_id, :quand, :ingredients_attributes
  belongs_to :user
  has_many :ingredients, :dependent => :destroy
  accepts_nested_attributes_for :ingredients, :allow_destroy => true

  def calories
  	ingredients.sum(&:calories)
  end


end
