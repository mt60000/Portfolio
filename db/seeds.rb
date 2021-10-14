# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  name: 'てすと',
  policy: 'てすとですよ',
  email: 'a@gmail.com',
  password: 'password'
)

User.create!(
  name: 'おもち',
  policy: 'てすとですよね',
  email: 'b@gmail.com',
  password: 'password'
)

Mood.create!(
  image: "so_bad"
)

Mood.create!(
  image: "bad"
)

Mood.create!(
  image: "so_so"
)

Mood.create!(
  image: "good"
)

Mood.create!(
  image: "so_good"
)

Authority.create!(
  delete_group: false,
  change_group: false,
  member_control: false
)

Authority.create!(
  delete_group: true,
  change_group: true,
  member_control: true
)

Diary.create!(
  user_id: 1,
  mood_id: 1,
  keep: 'てすとがんばった',
  problem: 'てすとだめだった',
  try: 'てすとがんばる！',
  text: 'てすとのぶんしょうです。いっぱいかいておきます。がんばりました。'
)

Diary.create!(
  user_id: 1,
  mood_id: 4,
  keep: 'てすとがんばった',
  problem: 'てすとだめだった',
  try: 'てすとがんばる！',
  text: 'てすとのぶんしょうです。いっぱいかいておきます。がんばりました。'
)

Diary.create!(
  user_id: 2,
  mood_id: 1,
  keep: 'てすとがんばった',
  problem: 'てすとだめだった',
  try: 'てすとがんばる！',
  text: 'てすとのぶんしょうです。いっぱいかいておきます。がんばりました。'
)