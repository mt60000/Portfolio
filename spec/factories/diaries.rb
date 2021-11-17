FactoryBot.define do
  factory :diary do
    keep { "keep" }
    problem { "problem" }
    try { "try" }
    text { "text" }
    start_time { Time.now }
    user_id { 1 }
    mood_id { 1 }
  end
end
