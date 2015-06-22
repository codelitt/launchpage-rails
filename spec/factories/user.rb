FactoryGirl.define do
  factory :user do
    email 'pepa_pig@gmail.com'
    usertype 1

    factory :user_with_blank_email do
      email ''
    end
  end
end
