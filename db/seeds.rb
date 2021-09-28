

# User.create(name: "gedeon", email: "gedeon@yahoo.fr", user_role: "simple_user", password: "123456", password_confirmation: "123456")
#
# #User.create(name: "gedeon", email: "gedeon@yahoo.fr", user_role: "admin", password: "123456admin", password_confirmation: "123456admin")
# User.create(name: "superadmin", email: "admin@yahoo.fr", user_role: "admin", password: "123456admin", password_confirmation: "123456admin")
# User.create(name: "gedeon", email: "gedeon@yahoo.fr", user_role: "author", password: "123456author", password_confirmation: "123456author")


User.create(name: "gedeon", email: "gedeon@yahoo.fr", user_role: "simple_user", password: "123456", password_confirmation: "123456")
User.create(name: "gedeon", email: "gedeon123@yahoo.fr", user_role: "admin", password: "123456admin", password_confirmation: "123456admin")
User.create(name: "gedeon", email: "gedeonad@yahoo.fr", user_role: "author", password: "123456author", password_confirmation: "123456author")




Category.create(name:"Politique")
Category.create(name:"sante")
Category.create(name:"Sport")
Category.create(name:"Divertisement")
Category.create(name:"Technologie")
Category.create(name:"Culture")
Category.create(name:"Tourisme")
Category.create(name:"Economie")
Category.create(name:"Societe")
Category.create(name:"Environnement")
Category.create(name:"Religion")
Category.create(name:"Actualite")

require 'faker'

5.times do |index|
	User.create!(
	    name: Faker::Name.name,
	    email: Faker::Internet.email,
      user_role: "admin",
	    password: "password",
	    password_confirmation: "password",
	)
end

def time_rand from = 0.0, to = Time.now
    Time.at(from + rand * (to.to_f - from.to_f))
end

5.times do |index|
	Publication.create!(
	    title: Faker::Book.title,
	    content: Faker::Lorem.paragraph,
      image: Faker::LoremFlickr.image,
	    date: time_rand.year.to_s+"/"+time_rand.month.to_s+"/"+time_rand.day.to_s,
	    user_id: User.all.pluck(:id).sample,
      category_id: Category.all.pluck(:id).sample,
	)
end

5.times do |index|
	Comment.create!(
	    content: Faker::Lorem.sentences(number: 2),
	    name:  Faker::Lorem.word,
      email: Faker::Internet.email,
	    publication_id: Publication.all.pluck(:id).sample,
	)
end

5.times do |index|
	Category.create!(
			name:  Faker::Lorem.word,
	)
end

5.times do |index|
	Favorite.create!(

	    user_id: User.all.pluck(:id).sample,
      publication_id: Publication.all.pluck(:id).sample,
	)
end
#
#
#
#
#
#



















#User.create(name: "anselme", email: "anselme@yahoo.fr", admin: "true", password: "123456", password_confirmation: "123456")
