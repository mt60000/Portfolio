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

Diary.create!(
  user_id: 1,
  mood: 2,
  keep: 'てすとがんばった',
  problem: 'てすとだめだった',
  try: 'てすとがんばる！',
  text: 'てすとのぶんしょうです。いっぱいかいておきます。がんばりました。'
)

Diary.create!(
  user_id: 1,
  mood: 3,
  keep: 'てすとがんばった',
  problem: 'てすとだめだった',
  try: 'てすとがんばる！',
  text: 'てすとのぶんしょうです。いっぱいかいておきます。がんばりました。'
)

Diary.create!(
  user_id: 2,
  mood: 4,
  keep: 'てすとがんばった',
  problem: 'てすとだめだった',
  try: 'てすとがんばる！',
  text: 'てすとのぶんしょうです。いっぱいかいておきます。がんばりました。'
)