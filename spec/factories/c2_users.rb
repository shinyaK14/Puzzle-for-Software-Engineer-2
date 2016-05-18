FactoryGirl.define do
  factory :c2_user do
    username { Faker::Name.first_name }
    email { Faker::Internet.email }
    password SecureRandom.urlsafe_base64(12).html_safe
    token SecureRandom.urlsafe_base64(12).html_safe
  end
end
