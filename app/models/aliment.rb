class Aliment < ActiveRecord::Base
  attr_accessible :calories, :name, :portion, :unite_id
  validates_presence_of :calories, :name, :portion
  belongs_to :unite

  def full_name
  	[name,portion.to_s,unite.name].join('')
  end

end
