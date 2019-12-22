FactoryBot.define do
  factory :group do
    course { course }

    factory :future_group do
      date_start { Date.current + 7.days }
      date_finish { Date.current + 17.days }
    end

    factory :current_group do
      date_start { Date.current - 7.days }
      date_finish { Date.current + 7.days }
    end

    factory :past_group do
      date_start { Date.current - 27.days }
      date_finish { Date.current - 7.days }
    end
  end
end