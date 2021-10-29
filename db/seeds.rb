# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  name: '田中',
  policy: '楽しく過ごしたい',
  email: 'a@gmail.com',
  password: 'password'
)

User.create!(
  name: 'すずき',
  policy: '皆さんよろしくお願いします。',
  email: 'b@gmail.com',
  password: 'password'
)

Mood.create!(
  image: 'so_bad'
)

Mood.create!(
  image: 'bad'
)

Mood.create!(
  image: 'so_so'
)

Mood.create!(
  image: 'good'
)

Mood.create!(
  image: 'so_good'
)

Authority.create!(
  role: 'リーダー'
)

Authority.create!(
  role: 'サブリーダー'
)

Authority.create!(
  role: 'メンバー'
)

Diary.create!(
  user_id: 1,
  mood_id: 4,
  keep: '効率よくコードを書くことができた！',
  problem: 'GitHubですこしつまずいた...',
  try: 'GitHubの問題を解決する',
  text: '今日はいろいろなことを学べた。明日は休みなので全力で遊ぶ！',
  start_time: Time.now.yesterday
)

Diary.create!(
  user_id: 1,
  mood_id: 5,
  text: '今日は友達と甘いものを食べに行った！',
  start_time: Time.now
)

Diary.create!(
  user_id: 2,
  mood_id: 1,
  keep: '早起きできた',
  problem: '集中が続かなかった',
  try: '集中力が切れたら休憩をはさんでみる',
  text: '今日はかなり進みが悪かった。明日は集中して巻き返したい。',
  start_time: Time.now
)

Group.create!(
  name: '勉強頑張る会',
  policy: '一日の振り返りはしっかりと！わからないことは気軽に質問しよう！'
)

GroupUser.create!(
  user_id: 1,
  group_id: 1,
  authority_id: 2
)

GroupUser.create!(
  user_id: 2,
  group_id: 1,
  authority_id: 1
)

GroupDiary.create!(
  user_id: 2,
  group_id: 1,
  mood_id: 4,
  text: '今作っているアプリに非同期通信を実装した。少しは理解できたと思う。',
  start_time: Time.now
)

GroupDiary.create!(
  user_id: 1,
  group_id: 1,
  mood_id: 1,
  text: '非同期通信全然わからない...',
  start_time: Time.now
)

GroupComment.create!(
  user_id: 2,
  group_diary_id: 2,
  text: 'よろしければ、お教えしましょうか?'
)

GroupComment.create!(
  user_id: 1,
  group_diary_id: 2,
  text: 'ありがとうございます！通話つなげます。'
)

GroupComment.create!(
  user_id: 2,
  group_diary_id: 2,
  text: '了解です。'
)
