FactoryBot.define do
  factory :user do
    password { 'password' }
    password_confirmation { 'password' }

    factory :admin do
      email { 'admin@example.com' }
      role { 'admin' }
    end

    factory :student do
      email { 'student@example.com' }
      role { 'student' }
    end

    factory :teacher do
      email { 'teacher@example.com' }
      role { 'teacher' }
    end
  end
end