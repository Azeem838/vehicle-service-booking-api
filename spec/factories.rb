FactoryBot.define do
  factory :random_appointment, class: Appointment do
    user_id { nil }
    service_id { Faker::Number.between(from: 1, to: 3) }
    start_time { Faker::Time.forward(days: 2, period: :morning) }
    end_time { start_time + 3 }
    description { Faker::Lorem.sentence }
  end

  factory :random_user, class: User do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
