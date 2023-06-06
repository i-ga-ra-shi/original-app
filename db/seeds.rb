# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb

# ユーザーデータの作成
User.create(school: 'テスト高校', email: 'test1@test', password: 'test11')
User.create(school: 'テスト中学校', email: 'test2@test', password: 'test22')
User.create(school: 'テスト小学校', email: 'test3@test', password: 'test33')

# subjectsデータの作成
subject_ids = [2, 3, 4, 5, 6, 7, 8]
sub_subjects = [["現代文", "古典"], ["日本史", "世界史", "現代社会"], ["数学I", "数学A","数学III"], ["化学", "物理", "生物"], ["コミュニケーション", "文法"], ["家庭科", "情報", "体育", "芸術"], ["部活動", "委員会"]]
titles = ['タイトル1', 'タイトル2', 'タイトル3', 'タイトル4']
month_ids = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
student_ids = [2, 3, 4, 5, 6, 7, 8]
names = ['A', 'B', 'C', 'D', 'E']
contents = [
  "Et libero natus voluptatem sunt repellendus et.",
  "Non omnis dolor et quisquam numquam quia.",
  "Dolore vero rerum ut ipsum dolorem et.",
  "Nemo quo quia autem nam veniam.",
  "Illum impedit qui aut voluptate expedita.Et libero natus voluptatem sunt repellendus et.Non omnis dolor et quisquam numquam quia.Dolore vero rerum ut ipsum dolorem et."
]
user_ids = [1, 2, 3]

30.times do
  subject_id = subject_ids.sample
  Subject.create(
    subject_id: subject_id,
    sub_subject: sub_subjects[subject_id - 2].sample,
    title: titles.sample,
    month_id: month_ids.sample,
    student_id: student_ids.sample,
    name: names.sample,
    content: contents.sample,
    user_id: user_ids.sample
  )
end

