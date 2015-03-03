
FactoryGirl.define do
  factory :frameset, :class => Refinery::Framesets::Frameset do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

