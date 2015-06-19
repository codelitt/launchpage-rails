FactoryGirl.define do
  factory :user do

    factory :valid_user do
      email "pepa_pig@gmail.com"
      typestatus 1
    end

  end
end
