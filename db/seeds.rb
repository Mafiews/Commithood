# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ilana
require 'faker'
require 'open-uri'

puts 'Destroying...'
User.destroy_all
Event.destroy_all
Ngo.destroy_all

puts 'Loading...'

volunteer_user = User.create!(
  email: "commit@hood.com",
  password: "test12345",
  first_name: "Commit",
  last_name: "Hood",
  address: "16 Villa Gaudelet, 75011 Paris",
  phone_number: Faker::PhoneNumber.phone_number_with_country_code,
  description: "J'aimerais aider les associations de ma ville à organiser des événéments"
)


puts "User #{volunteer_user.first_name} created"

admin_user = User.create!(
  email: "admin@admin.com",
  password: "test12345",
  first_name: "Admin",
  last_name: "Hood",
  address: "245 Rue Oberkampf, 75011 Paris",
  phone_number: "0612850678",
  description: "Je suis admin du monde entier",
  admin: true
  )

puts "User #{admin_user.first_name} created"

ngo_user = User.create!(
  email: "ngo@hood.com",
  password: "test12345",
  first_name: "NGO",
  last_name: "Hood",
  address: "14 rue Crespin du Gast, 75011 Paris",
  phone_number: Faker::PhoneNumber.phone_number_with_country_code,
  description: "Je fais partie d'une association qui recherche régulièrement des volontaires pour des événements"
)

puts "User #{ngo_user.first_name} created"

ngo = Ngo.create!(
  name: "France Nature Environnement Paris",
  kbis: "1234567",
  phone_number: Faker::PhoneNumber.phone_number_with_country_code,
  address: "2 rue du Dessous des Berges, 75013 Paris",
  description: "FNE Paris est la fédération départementale de FNE et des associations parisiennes de protection de l'environnement"
)

puts "NGO #{ngo.name} created"

event_1 = Event.create!(
  name: "Championnat de ramassage de déchets",
  start_date: Date.today,
  end_date: Date.today,
  description: "Le concept est simple et basé sur la confiance : ramassez par-ci par-là ce qui est abandonné un peu partout dans la nature, pesez vos trouvailles avant d'en faire bon usage (jeter à la poubelle ce qui doit être jeté, mettez au recyclage ce qui peut être recyclé, donnez ce qui peut être réparé, etc. Envoyez nous au plus tard le 30.09.2020 le cumule en kg de tout ce que vous avez ramassé dans la nature pendant le mois.",
  seats: "50",
  address: "13 Place du Pont Neuf, 75001 Paris",
  ngo_id: ngo.id
)

puts "#{event_1.name} is created"

img1 = URI.open('https://cdn-lejdd.lanmedia.fr/var/europe1/storage/images/lejdd/ecologie/pollution/pollution-la-premiere-competition-de-ramassage-des-dechets-se-deroule-demain-a-marseille-3901599/53092190-1-fre-FR/Pollution-la-premiere-competition-de-ramassage-des-dechets-se-deroule-demain-a-Marseille.jpg')


event_1.photo.attach(io: img1, filename: "event_#{event_1.id}.jpg", content_type: "image/png")

puts "Event #{event_1.name} created"

 event_2 = Event.create!(
   name: "Débat autour de la protection de l'environnement",
   start_date: "2020-08-30 14:00:00 UTC +02:00",
   end_date: "2020-08-30 18:00:00 UTC +02:00",
   description: "Objectif : sensibiliser le plus grand nombre sur la protection de l'environnement et les changements climatiques. Agissons ensemble dès à présent !",
   seats: "20",
   address: "2 Rue Perrée, 75003 Paris",
   ngo_id: ngo.id
 )
 img2 = URI.open('https://blog.pollutec.com/wp-content/uploads/2020/04/1024x634_protection-de-lenvironnement.jpg')
 event_2.photo.attach(io: img2, filename: "event#{event_2.id}.jpg", content_type: "image/png")


 puts "Event #{event_2.name} created"

 event_3 = Event.create!(
   name: "No Plastic Challenge !",
   start_date: "2020-09-04 09:00:00 UTC +02:00",
   end_date: "2020-09-04 12:00:00 UTC +02:00",
   description: "Cette année, 15 éco-gestes seront proposés pendant 15 jours pour réduire notre consommation de plastique et faire pression sur les fabricants. Nous avons besoin de vous, chers bénévoles, pour faire vivre notre action de sensibilsation et de mobilisation autour de la lutte contre la pollution plastique.",
   seats: "15",
   address: "11 Port de la Rapée, 75012 Paris",
   ngo_id: ngo.id
 )
 img3 = URI.open('https://www.ici-londres.com/data/img/thumbs/thaoss-no-plastic-200722-100504.jpg')
 event_3.photo.attach(io: img3, filename: "event#{event_3.id}.jpg", content_type: "image/png")


 puts "Event #{event_3.name} created"

puts "Seeds ✅"


