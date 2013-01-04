class Profile < ActiveRecord::Base
  attr_accessible :birthday, :gender, :taille, :user_id, :image_url,:comportement
  #belongs_to :user

  def uncomplete?
  	(taille.nil? || birthday.nil? || gender.nil?) ? true : false
  end

end
