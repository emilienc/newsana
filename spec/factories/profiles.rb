# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    birthday "18/05/1968"
    user_id 1
    taille 185
    gender :male
  end
end
