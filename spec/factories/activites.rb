# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activite do
    category_activite_id 1
    duree 1
    quand "2013-01-02"
  end
end
