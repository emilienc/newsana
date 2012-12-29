class Pesee < ActiveRecord::Base
  attr_accessible :user_id, :what, :quand
  belongs_to :user
end
