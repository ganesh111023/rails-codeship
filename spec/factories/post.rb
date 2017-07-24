FactoryGirl.define do
  factory :post do
    sequence(:name) {|n| "continuous_it#{n}"}
    description "test description"
  end
end
