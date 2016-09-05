4.times{User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password')}

8.times{Category.create(title: Faker::Commerce.department)}

30.times{Business.create(name: Faker::Company.name, url: Faker::Internet.url, category_id: (rand(8)+1) )}

100.times{Review.create(user_id: (rand(5)+1), business_id: (rand(30)+1), review: Faker::Lorem.sentence, rating: rand(6))}
