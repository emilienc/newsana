class Pesee < ActiveRecord::Base
  attr_accessible :user_id, :what, :quand
  belongs_to :user

  def start_time
  	quand
  end

  def event_name
    ['(',what.to_s,'Kg',')'].join(' ')
  end

end
