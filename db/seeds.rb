# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
      user_role: Faker::Role.user_role,
	    password: "password",
	    password_confirmation: "password",
	)
end


def time_rand from = 0.0, to = Time.now
    Time.at(from + rand * (to.to_f - from.to_f))
end

5.times do |index|
	Publication.create!(
	    title: Faker::Lorem.mots,
	    content: Faker::Lorem.paragraphe,
      image: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
	    date: time_rand.year.to_s+"/"+time_rand.month.to_s+"/"+time_rand.day.to_s,
	    publication_id: User.all.pluck(:id).sample,
      category_id: Category.all.pluck(:id).sample,


	)
end


5.times do |index|
	Comment.create!(
	    content: Faker::Lorem.mots,
	    name: Faker::Lorem.phrase,
      email: Faker::Internet.email,
	    publication_id: Publication.all.pluck(:id).sample,
	)
end


5.times do |index|
	Category.create!(

	    name: Faker::Lorem.phrase,

	)
end


5.times do |index|
	Favorite.create!(

	    user_id: User.all.pluck(:id).sample,
      publication_id: Publication.all.pluck(:id).sample,
	)
end


#User.create(name: "anselme", email: "anselme@yahoo.fr", admin: "true", password: "123456", password_confirmation: "123456")
