FactoryBot.define do
  factory :notification do
    visited_id { 2 }
    apply_id { 1 }
    group_id { 1 }
    action { "apply" }
  end
end
