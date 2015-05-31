FactoryGirl.define do 

  factory :comment do
    message "nom nom"
    rating "5_stars"
    association :user
    association :place
  end 

  factory :user do
    sequence :email do |n|
      "myemail#{n}@gmail.com"
    end
    password "password"   
  end

  factory :place do
    name "My Bakery"
    description "Tasty"
    address "1 Some Lane, Boston, MA 02163"
    latitude(42.3631519)
    longitude(-71.056098)
    association :user
    
  end

end