FactoryGirl.define do

  factory :event do
    sequence :title do |t|
      "Event #{t}"
    end
    sequence :description do |d|
      "Event #{d} is all about this wonderful fun thing."
    end
    email { |u| "#{u.first_name[0]}#{u.last_name}#{(1..99).to_a.sample}@example.com".downcase }
    start 2.days.from_now
  end

  factory :user do
    sequence :first_name do |f|
      "First#{f}"
    end
    sequence :last_name do |l|
      "Last#{l}"
    end
  end
  
  factory :ticket do
    association :user
    association :event
  end

end