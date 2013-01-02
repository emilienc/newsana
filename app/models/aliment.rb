class Aliment < ActiveRecord::Base
  attr_accessible :calories, :name, :portion, :unite_id
end
