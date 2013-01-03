# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  

  factory :unite do
  	name 'gramme'
  end


  factory :aliment do
  	calories 10
  	name 'Test'
  	portion 1
  	unite
  end

  factory :ingredient do
  	repa
  	quantite 2
  	aliment
  end

  factory :repa_without_name, :class => Repa do
    user_id 1
    quand "2013-01-01"
  end

  factory :repa do
    user_id 1
    quand "2013-01-01"
    name "dejeuner"

   

    factory :repa_with_ingredients do
 	
 		ignore do
        	ingredients_count 5
    	end


    	after(:create) do |repa,evaluator|
      	FactoryGirl.create_list(:ingredient, evaluator.ingredients_count,repa: repa)
    	end
	end
  end

end
