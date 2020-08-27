# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ilana
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
  phone_number: "0612345678",
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
  phone_number: "0689102346",
  description: "Je fais partie d'une association qui recherche régulièrement des volontaires pour des événements"
)
puts "User #{ngo_user.first_name} created"

another_ngo_user = User.create!(
  email: "ngo@ngo.com",
  password: "test12345",
  first_name: "NGO Owner",
  last_name: "NGO",
  address: "14 rue Crespin du Gast, 75011 Paris",
  phone_number: "0699093289",
  description: "Mon association recherche activement des volontaires"
)
puts "User #{another_ngo_user.first_name} created"

ngo_1 = Ngo.create!(
  name: "France Nature Environnement Paris",
  kbis: "1234567",
  phone_number: "0123457890",
  address: "2 rue du Dessous des Berges, 75013 Paris",
  description: "FNE Paris est la fédération départementale de FNE et des associations parisiennes de protection de l'environnement."
)
puts "NGO #{ngo_1.name} created"

ngo_2 = Ngo.create!(
  name: "Sport dans ma Ville",
  kbis: "23432356",
  phone_number: "0132506843",
  address: "14 rue Lesault, 93500 Pantin",
  description: "Principale association d'insertion par le sport en France."
)
puts "NGO #{ngo_2.name} created"

ngo_3 = Ngo.create!(
  name: "Odyssea",
  kbis: "42928052",
  phone_number: "0199029210",
  address: "14 rue Orfila, 75020 Paris",
  description: "Organise des courses pour soutenir la recherche contre le cancer du sein."
)
puts "NGO #{ngo_3.name} created"

ngo_4 = Ngo.create!(
  name: "Mission Locale de Paris",
  kbis: "1240858531",
  phone_number: "0199029210",
  address: "29 rue des Boulets, 75011 Paris",
  description: "Pour l'autonomie et l'insertion professionnelle des jeunes."
)
puts "NGO #{ngo_4.name} created"

event_1 = Event.create!(
  name: "Championnat de ramassage de déchets",
  start_date: DateTime.new(2020,7,1,9),
  end_date: DateTime.new(2020,7,31,18),
  description: "Le concept est simple et basé sur la confiance : ramassez par-ci par-là ce qui est abandonné un peu partout dans la nature, pesez vos trouvailles avant d'en faire bon usage (jeter à la poubelle ce qui doit être jeté, mettez au recyclage ce qui peut être recyclé, donnez ce qui peut être réparé, etc. Envoyez nous au plus tard le 30.09.2020 le cumule en kg de tout ce que vous avez ramassé dans la nature pendant le mois.",
  seats: 50,
  seats_left: 50,
  address: "13 Place du Pont Neuf, 75001 Paris",
  ngo_id: ngo_1.id
)
img1 = URI.open('https://cdn-lejdd.lanmedia.fr/var/europe1/storage/images/lejdd/ecologie/pollution/pollution-la-premiere-competition-de-ramassage-des-dechets-se-deroule-demain-a-marseille-3901599/53092190-1-fre-FR/Pollution-la-premiere-competition-de-ramassage-des-dechets-se-deroule-demain-a-Marseille.jpg')
event_1.photo.attach(io: img1, filename: "event_#{event_1.id}.jpg", content_type: "image/png")
event_1.tag_list.add("Environnement")

puts "Event #{event_1.name} is created"

event_2 = Event.create!(
 name: "Débat autour de la protection de l'environnement",
 start_date: DateTime.new(2020,8,25,14),
 end_date: DateTime.new(2020,8,25,18),
 description: "Objectif : sensibiliser le plus grand nombre sur la protection de l'environnement et les changements climatiques. Agissons ensemble dès à présent !",
 seats: 20,
 seats_left: 20,
 address: "2 Rue Perrée, 75003 Paris",
 ngo_id: ngo_1.id
)
img2 = URI.open('https://blog.pollutec.com/wp-content/uploads/2020/04/1024x634_protection-de-lenvironnement.jpg')
event_2.photo.attach(io: img2, filename: "event#{event_2.id}.jpg", content_type: "image/png")
event_2.tag_list.add("Environnement, Santé", parse: true)

puts "Event #{event_2.name} created"

event_3 = Event.create!(
 name: "No Plastic Challenge !",
 start_date: DateTime.new(2020,9,4,9),
 end_date: DateTime.new(2020,9,4,12),
 description: "Cette année, 15 éco-gestes seront proposés pendant 15 jours pour réduire notre consommation de plastique et faire pression sur les fabricants. Nous avons besoin de vous, chers bénévoles, pour faire vivre notre action de sensibilsation et de mobilisation autour de la lutte contre la pollution plastique.",
 seats: 15,
 seats_left: 15,
 address: "11 Port de la Rapée, 75012 Paris",
 ngo_id: ngo_1.id
)
img3 = URI.open('https://www.ici-londres.com/data/img/thumbs/thaoss-no-plastic-200722-100504.jpg')
event_3.photo.attach(io: img3, filename: "event#{event_3.id}.jpg", content_type: "image/png")
event_3.tag_list.add("Environnement, Culture, Santé", parse: true)

puts "Event #{event_3.name} created"

event_4 = Event.create!(
 name: "Café cityoyen",
 start_date: DateTime.new(2020,8,24,15),
 end_date: DateTime.new(2020,8,24,17),
 description: "Vous souhaitez vous engager dans une association ? Venez nous aider à organiser cette table ronde autour du service civique.",
 seats: 5,
 seats_left: 5,
 address: "6 rue de la Comète, 75007 Paris",
 ngo_id: ngo_4.id
)
img4 = URI.open('https://cafedesimages.fr/wp-content/uploads/2018/01/cafe-citoyen-e1516469602783-1300x605.jpg')
event_4.photo.attach(io: img4, filename: "event#{event_4.id}.jpg", content_type: "image/png")
event_4.tag_list.add("Isolement, Précarité", parse: true)

puts "Event #{event_4.name} created"

event_5 = Event.create!(
 name: "Course Odysséa Paris 2020",
 start_date: DateTime.new(2020,10,1,8),
 end_date: DateTime.new(2020,10,4,19),
 description: "Engagez-vous pour la recherche contre le cancer. Nous avons besoin de volontaires pour tenir les stands d'enregistrement et ravitaillement.",
 seats: 50,
 seats_left: 50,
 address: "2 route de la ferme, 75012 Paris",
 ngo_id: ngo_3.id
)
img5 = URI.open('http://www.u-run.fr/wp-content/uploads/2015/06/10488119_1064186336943033_6425489115595270322_n.jpg')
event_5.photo.attach(io: img5, filename: "event#{event_5.id}.jpg", content_type: "image/png")
event_5.tag_list.add("Environnement, Santé, Sport", parse: true)

puts "Event #{event_5.name} created"

event_6 = Event.create!(
 name: "Aider les parisiennes à accéder à l'emploi ou à formation",
 start_date: DateTime.new(2020,9,8,14),
 end_date: DateTime.new(2020,9,8,16),
 description: "Venez partager vos connaissances en recherche d'emploi : CV, entretien, etc.",
 seats: 10,
 seats_left: 10,
 address: "24 rue de la Solidarité, 75019 Paris",
 ngo_id: ngo_4.id
)
img6 = URI.open('http://www.yonne.gouv.fr/var/ide_site/storage/images/politiques-publiques/economie-et-emploi/emploi/les-contrats-aides/96875-3-fre-FR/Les-contrats-aides_large.jpg')
event_6.photo.attach(io: img6, filename: "event#{event_6.id}.jpg", content_type: "image/png")
event_6.tag_list.add("Précarité, Isolement, Formation", parse: true)

puts "Event #{event_6.name} created"

event_7 = Event.create!(
 name: "L dans ma ville",
 start_date: DateTime.new(2020,9,13,10),
 end_date: DateTime.new(2020,9,13,12),
 description: "Venez encadrer un cours de danse pour de jeunes adolescentes dans des quartiers défavorisés.",
 seats: 5,
 seats_left: 5,
 address: "50 rue Rambuteau, 75003 Paris",
 ngo_id: ngo_2.id
)
img7 = URI.open('https://shoelifer.com/wp-content/uploads/2019/10/Shoelifer-Une-spot-beaute-studio-7-danse-urbaine-hip-hop-casablanca-2019.jpg')
event_7.photo.attach(io: img7, filename: "event#{event_7.id}.jpg", content_type: "image/png")
event_7.tag_list.add("Isolement, Jeunesse, Santé, Culture, Sport", parse: true)

puts "Event #{event_7.name} created"

event_8 = Event.create!(
 name: "Balle de Match",
 start_date: DateTime.new(2020,9,5,14),
 end_date: DateTime.new(2020,9,5,18),
 description: "Donnez des cours de tennis pour de jeunes débutants",
 seats: 5,
 seats_left: 5,
 address: "101 rue de la station, 93700 Drancy",
 ngo_id: ngo_2.id
)
img8 = URI.open('https://www.fft.fr/sites/default/files/styles/image_16_9/public/20180623_cf_fs_0057_web.jpg?h=18143cfe&itok=_0-9b92k')
event_8.photo.attach(io: img8, filename: "event#{event_8.id}.jpg", content_type: "image/png")
event_8.tag_list.add("Jeunesse, Santé, Sport, Formation", parse: true)

puts "Event #{event_8.name} created"

puts "Seeds ✅"
