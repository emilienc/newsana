class Profile < ActiveRecord::Base
  attr_accessible :birthday, :gender, :taille, :user_id, :image_url,:comportement,:morphologie
  #belongs_to :user

  def uncomplete?
  	(taille.nil? || birthday.nil? || gender.nil?) ? true : false
  end

  def female?
  	(gender == "femme") || (gender == "female")
  end

  def male?
  	(gender == "homme") || (gender == "male")
  end


end
