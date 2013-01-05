

class Activite < ActiveRecord::Base
  attr_accessible :category_activite_id, :duree, :quand, :user_id
  belongs_to :category_activite
  belongs_to :user


 def calories
 	if ( user.profile.gender == "male")
 		@BMR = (13.75*user.poids) + (5*user.taille) - (6.76*user.age) + 66
 	else
 		@BMR = (9.56*user.poids) + (1.85*user.taille) - (4.68*user.age) + 655
 	end

	(@BMR/24)*category_activite.MET*(duree/60.0) 	unless category_activite.nil?
 end

 def start_time
  	quand
  end

  def event_name
    [category_activite.name,'(',calories.round.to_s,'Kcal',')'].join(' ')
  end



end
