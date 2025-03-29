User.create!(name:  "shiroishi",
    email: "sugu01140114@gmail.com",
    password:              "password",
    password_confirmation: "password",
    admin: true,
    activated: true,
    activated_at: Time.zone.now
)

# 追加のユーザーをまとめて生成する
30.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name:  name,
      email: email,
      password:              password,
      password_confirmation: password,
      activated: true,
      activated_at: Time.zone.now)
end

user = User.find_by(email: 'sugu01140114@gmail.com')
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  user.microposts.create!(content: content)
end