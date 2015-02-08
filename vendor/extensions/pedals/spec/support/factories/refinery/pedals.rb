
FactoryGirl.define do
  factory :pedal, :class => Refinery::Pedals::Pedal do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

