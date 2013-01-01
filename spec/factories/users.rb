FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'please'
    password_confirmation 'please'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
    profile

    factory :user_with_repas do
      ignore do
            repas_count 5
      end
      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:repa, evaluator.posts_count, user: user)
      end
    end

    factory :user_with_pesees do
        ignore do
            pesees_count 5
        end
      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:pesee, evaluator.posts_count, user: user)
      end
    end

  end
end