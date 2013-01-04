# encoding: UTF-8

class Doctor

	def self.female?(gender)
		(gender == "female")
	end

	def self.formule_besoin_quotidien(metabolisme,comportement)
		case comportement
		when "sédentaire"
		 	metabolisme*1.2
		when "légèrement actif"
			metabolisme*1.375
		when "modérément actif"
			metabolisme*1.55
		when "très actif"
			metabolisme*1.725
		when "très très actif"
			metabolisme*1.9
		end
	end

	def self.formule_poids_ideal(taille,gender)
		if female?(gender)
			(taille - 100 - ((taille - 150) / 2.5))
		else
		    (taille - 100 - ((taille - 150) / 4.0))
		end
	end

	def self.formule_metabolisme(taille,poids,age,gender)
		if female?(gender)
    		 #230*(poids**0.48*taille**0.5*age**-0.13) 
    		 (9.56*poids) + (1.85*taille) - (4.68*age) + 655
    	else
    		 #259*(poids**0.48*taille**0.5*age**-0.13)
    		 (13.75*poids) + (5*taille) - (6.76*age) + 66
    	end
	end

	def self.formule_img(imc,age,gender)
		if female?(gender)
			(1.2*imc)+(0.23*age)-10.8*0-5.4
		else
			(1.2*imc)+(0.23*age)-10.8*1-5.4
		end
				
	end

	def self.formule_imc(poids,taille)
		taille /= 100.0
		(poids/(taille*taille)).round(1)
	end


	def self.poids_ideal(user)
		formule_poids_ideal(user.taille,user.profile.gender) 
	end

	def self.metabolisme(user)
		formule_metabolisme(user.taille,user.poids,user.age,user.profile.gender).round	
	end

	def self.imc(user)
		formule_imc(user.poids,user.taille) 
	end

	def self.besoin_quotidien(user)
		formule_besoin_quotidien(metabolisme(user),user.profile.comportement)
	end

	def self.img(user)
		formule_img(formule_imc(user.poids,user.taille),user.age,user.profile.gender).round(1) 
	end

	def self.avis_img(user)
    	case img(user)
    		when 0..15
      			"trop maigre"
    		when 15..20
      			female?(user.profile.gender) ? "trop maigre" : "normal"
    		when 25..30
      			female?(user.profile.gender) ? "normal" : "trop de graisse"
    		else
      			"trop de graisse"
    	end
  end


	def self.avis_imc(user)
		unless user.age < 18
			case imc(user)
				when 0..16.5
      				"famine"
    			when 16.5..18.5
      				"maigreur"
    			when 18.5..25
      				I18n.t "imc.normal"
    			when 25..30
      				I18n.t "imc.surpoids"
    			when 30..35
      				"obésité modérée"
    			when 35..40
      				"obésité sévère"
    			else
      				"obésité massive"

    		end
        end
    end

end