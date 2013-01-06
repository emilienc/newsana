# encoding: UTF-8

class Doctor

	def self.formule_calories_poids_cible_duree(poids,cible,duree)
		((poids-cible)*500.0)/duree
	end


	def self.formule_besoin_quotidien(metabolisme,comportement)
		@besoin =0
		case comportement
		when "sédentaire"
		 	@besoin=metabolisme*1.2
		when "légèrement actif"
			@besoin=metabolisme*1.375
		when "modérément actif"
			@besoin=metabolisme*1.55
		when "très actif"
			@besoin=metabolisme*1.725
		when "très très actif"
			@besoin=metabolisme*1.9
		end
		@besoin.round
	end

	def self.formule_poids_ideal(taille,gender)
		if gender.female?
			(taille - 100 - ((taille - 150) / 2.5))
		else
		    (taille - 100 - ((taille - 150) / 4.0))
		end
	end

	def self.formule_metabolisme(taille,poids,age,gender)
		if gender.female?
    		 #230*(poids**0.48*taille**0.5*age**-0.13) 
    		 ((9.56*poids) + (1.85*taille) - (4.68*age) + 655).round
    	else
    		 #259*(poids**0.48*taille**0.5*age**-0.13)
    		 ((13.75*poids) + (5*taille) - (6.76*age) + 66).round
    	end
	end

	def self.formule_img(imc,age,gender)
		if gender.female?
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
		formule_poids_ideal(user.taille,user.profile) 
	end

	def self.metabolisme(user)
		formule_metabolisme(user.taille,user.poids,user.age,user.profile).round	
	end

	def self.imc(user)
		formule_imc(user.poids,user.taille) 
	end

	def self.besoin_quotidien(user)
		formule_besoin_quotidien(metabolisme(user),user.profile.comportement)
	end

	def self.img(user)
		formule_img(formule_imc(user.poids,user.taille),user.age,user.profile).round(1) 
	end

	def self.besoin_cible(user)
		@besoin=0
		unless user.poids.nil? ||  user.target.nil?
			@besoin=formule_besoin_quotidien(metabolisme(user),user.profile.comportement)-formule_calories_poids_cible_duree(user.poids,user.target.poids,user.target.duree-Date.today)
		end
		@besoin.round
	end

	def self.label_img(user)
    	case img(user)
    		when 0..15
      			"label-important"
    		when 15..20
      			user.profile.female? ? "label-warning" : "label-success"
    		when 25..30
      			user.profile.female? ? "label-success" : "label-warning"
    		else
      			"label-important"
    	end
    end



	def self.avis_img(user)
    	case img(user)
    		when 0..15
      			"trop maigre"
    		when 15..20
      			user.profile.female? ? "trop maigre" : "normal"
    		when 25..30
      			user.profile.female? ? "normal" : "trop de graisse"
    		else
      			"trop de graisse"
    	end
    end


    def self.label_imc(user)
		unless user.age < 18
			case imc(user)
				when 0..16.5
      				"label-important"
    			when 16.5..18.5
      				"label-warning"
    			when 18.5..25
      				"label-success"
    			when 25..30
      				"label-warning"
    			when 30..35
      				"label-warning"
    			when 35..40
      				"label-important"
    			else
      				"label-important"

    		end
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