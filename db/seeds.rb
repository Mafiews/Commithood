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
  first_name: "Sébastien",
  last_name: "Folin",
  address: "16 Villa Gaudelet, 75011 Paris",
  phone_number: "0612345678",
  description: "J'aimerais aider les associations de ma ville à organiser des événéments"
)
avatar1 = URI.open('https://www.google.com/url?sa=i&url=http%3A%2F%2Fwww.premiere.fr%2FStar%2FSebastien-Folin&psig=AOvVaw3gxOLoTx7oxKJzBz5d5fiD&ust=1598709856343000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKCfq72IvusCFQAAAAAdAAAAABAD')
volunteer_user.photo.attach(io: avatar1, filename: "photo#{volunteer_user.id}.jpg", content_type: "image/png")
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
logo1 = URI.open('https://www.respire-asso.org/wp-content/uploads/2011/07/logo-asef.jpg')
ngo_1.photo.attach(io: logo1, filename: "logo#{ngo_1.id}.jpg", content_type: "image/png")
puts "NGO #{ngo_1.name} created"

ngo_2 = Ngo.create!(
  name: "Sport dans ma Ville",
  kbis: "23432356",
  phone_number: "0132506843",
  address: "14 rue Lesault, 93500 Pantin",
  description: "Sport dans ma Ville est la principale association d'insertion par le sport en France."
)
logo2 = URI.open('https://www.sportdanslaville.com/wp-content/themes/sport-dans-la-ville/img/logo_sdlv.png')
ngo_2.photo.attach(io: logo2, filename: "logo#{ngo_2.id}.jpg", content_type: "image/png")

puts "NGO #{ngo_2.name} created"

ngo_3 = Ngo.create!(
  name: "Odyssea",
  kbis: "42928052",
  phone_number: "0199029210",
  address: "14 rue Orfila, 75020 Paris",
  description: "Organise des courses pour soutenir la recherche contre le cancer du sein."
)
logo3 = URI.open('https://hand.jdadijon.com/wp-content/uploads/2016/05/le-logo-odyssea.jpg')
ngo_3.photo.attach(io: logo3, filename: "logo#{ngo_3.id}.jpg", content_type: "image/png")

puts "NGO #{ngo_3.name} created"

ngo_4 = Ngo.create!(
  name: "Mission Locale de Paris",
  kbis: "1240858531",
  phone_number: "0199029210",
  address: "29 rue des Boulets, 75011 Paris",
  description: "Pour l'autonomie et l'insertion professionnelle des jeunes."
)
logo4 = URI.open('https://pbs.twimg.com/profile_images/1205154832291639296/jlzxqiek.jpg')
ngo_4.photo.attach(io: logo4, filename: "logo#{ngo_4.id}.jpg", content_type: "image/png")
puts "NGO #{ngo_4.name} created"

ngo_5 = Ngo.create!(
  name: "Club de Défense des Animaux Paris 12",
  kbis: "891914",
  phone_number: "0143405158",
  address: "181 avenue Daumesnil, 75012 Paris ",
  description: "Le Club de Défense des Animaux Paris 12, créé en 1979, a pour objetif premier d'intervenir sur un secteur géographique réduit pour travailler davantage en profondeur que ne le peuvent les associations nationales de protection animale.
  Reconnu d'utilité publique en 1990, le Club recueille et stérilise des animaux errants et les place dans des familles de bénévoles le temps qu'ils soient adoptés.
  Nous recherchons souvent des volontaires pour nous aider dans les diverses tâches de gestion des animaux et d'accueil du public."
)
logo5 = URI.open('https://www.facebook.com/cda12/photos/a.126919857388415/1033343870079338/?type=1&theater')
ngo_5.photo.attach(io: logo5, filename: "logo#{ngo_5.id}.jpg", content_type: "image/png")
puts "NGO #{ngo_5.name} created"

ngo_6 = Ngo.create!(
  name: "La Fabrique de la Solidarité",
  kbis: "3786938908",
  phone_number: "0155782363",
  address: "98 quai de la Rapée, 75012 Paris",
  description: "La Fabrique de la Solidarité, est un lieu ressource de la Ville de Paris pour tou·te·s les Parisien·ne·s souhaitant agir dans le domaine de la lutte contre l’exclusion.
Poussez donc la porte et rencontrez l'équipe du lieu qui vous expliquera toutes ses missions et comment vous pouvez vous engager contre l'exclusion en étant formé et accompagné."
)
logo6 = URI.open('https://res.cloudinary.com/dw5mswvza/image/upload/v1598945610/logo_fabrique_jmcigh.jpg')
ngo_6.photo.attach(io: logo6, filename: "logo#{ngo_6.id}.jpg", content_type: "image/jpg")
puts "NGO #{ngo_6.name} created"

ngo_7 = Ngo.create!(
  name: "Développement Animation Vélo Solidaire",
  kbis: "583620957",
  phone_number: "0777070695",
  address: "17, boulevard Jourdan 75014 Paris",
  description: "L’association DAVS (Développement Animation Vélo solidaire) met en place des projets socio-culturels et sportifs autour de la pratique et de l’apprentissage du vélo.
Au sein de la Vélo Ecole Paris Sud, nous accueillons tout au long de l’année des adultes ne sachant pas faire de vélo pour les accompagner dans la découverte de cette pratique.
Durant les vacances nous accueillons les enfants à partir de 5 ans dans nos stages de vélo.
Tout au long de l’année nous animons et accompagnons plusieurs projets autour de la pratique du vélo en partenariat avec :
Les écoles et collèges d’Ile de France
Les centres sociaux, Points jeunes, MJC…
Les associations d’insertion et/ou d’accompagnement de publics en difficultés
Des groupes d’étudiants
Des collectivités et entreprises."
)
logo7 = URI.open('https://www.facebook.com/veloecoledavs/photos/a.926192160844819/928568253940543/?type=1&theater')
ngo_7.photo.attach(io: logo7, filename: "logo#{ngo_7.id}.jpg", content_type: "image/png")
puts "NGO #{ngo_7.name} created"

ngo_8 = Ngo.create!(
  name: "Mairie de Paris",
  kbis: "678584309",
  phone_number: "0142766384",
  address: "4 rue Lobau 75004 Paris",
  description: "Appels à bénévoles, appels au don, solidarité alimentaire...
  La Ville de Paris vous propose jemengage.paris, service numérique de soutien à l’engagement citoyen. A vous de jouer !"
)
logo8 = URI.open('https://ecoentreprises-france.fr/wp-content/uploads/2019/06/ville-de-paris2.png')
ngo_8.photo.attach(io: logo8, filename: "logo#{ngo_8.id}.jpg", content_type: "image/png")
puts "NGO #{ngo_8.name} created"

ngo_9 = Ngo.create!(
  name: "Autre monde",
  kbis: "5832082687",
  phone_number: "0143149687",
  address: "30 rue de la Mare 75020 Paris",
  description: "Implantée dans le 20ème arrondissement, Autremonde agit contre l'indifférence et les exclusions et milite pour que chacun ait une place dans l'espace social.
  Elle a pour mission principale de renouer et maintenir le lien avec des personnes en situation de précarité, de migration et d'isolement.
  Les personnes accueillies viennent le plus souvent des alentours, mais également de toute la capitale et de proche banlieue. Lien social et mixité sont les marques de fabrique de l’association.
  Le bénévolat y tient une place essentielle : toutes les actions de terrain sont conduites par des bénévoles, recrutés, formés et accompagnés par l’équipe salariée."
)
logo9 = URI.open('https://www.tousbenevoles.org/images/association/1418229747.png')
ngo_9.photo.attach(io: logo9, filename: "logo#{ngo_9.id}.jpg", content_type: "image/png")
puts "NGO #{ngo_9.name} created"

ngo_10 = Ngo.create!(
  name: "Association Caméléon",
  kbis: "6408906542",
  phone_number: "0143223592",
  address: "32 rue Robert Lindet 75015 Paris",
  description: "Dans un monde où les violences sexuelles sont insidieuses, banalisées, taboues et rarement punies, nourries par la culture du silence liée à l’ignorance, la peur, la honte ou le déni, il est urgent d’agir.
Caméléon est une association de solidarité internationale née en 1997. Elle développe une approche globale pour agir sur les causes et les effets des violences sexuelles à l’égard des enfants et des adolescents."
)
logo10 = URI.open('https://www.cameleon-association.org/wp-content/uploads/2014/08/logo-slogan_2013_FR-Fond-blanc.jpg')
ngo_10.photo.attach(io: logo10, filename: "logo#{ngo_10.id}.jpg", content_type: "image/jpg")
puts "NGO #{ngo_10.name} created"

ngo_11 = Ngo.create!(
  name: "Brigade Animale Bénévole",
  kbis: "84260492900015",
  phone_number: "0167395397",
  address: "11 rue de Lourmel 75015 Paris",
  description: "L’équipe de la Brigade Animale Bénévole a créé son association ! Cela va nous permettre une meilleure réactivité (conditionnée au nombre de familles d’accueil), et surtout offrir la possibilité de déposer plainte en notre nom si nous l’estimons nécessaire.
Rejoignez notre équipe de bénévoles : nous recherchons des bénévoles dans toute la France. Le rôle du bénévole peut être multiple, par exemple : effectuer des repérages, prendre des photos, des vidéos, déposer des mains courantes ou plaintes au nom de l’association (sous procuration) au commissariat, transporter les animaux dans leur famille d'accueil, chez le vétérinaire, effectuer des pré- et postvisites pour de futurs adoptants ou familles d'accueil etc...
Rejoignez notre équipe de familles d’accueil : Vous pouvez accueillir un animal chez vous, pendant quelques jours, quelques semaines ou plus ? Contactez nous !"
)
logo11 = URI.open('https://res.cloudinary.com/dw5mswvza/image/upload/v1598946445/logo_bab_ovrueu.png')
ngo_11.photo.attach(io: logo11, filename: "logo#{ngo_11.id}.jpg", content_type: "image/png")
puts "NGO #{ngo_11.name} created"

event_1 = Event.create!(
  name: "Championnat de ramassage de déchets",
  start_date: DateTime.new(2020,9,1,9),
  end_date: DateTime.new(2020,9,30,18),
  description: "Le concept est simple et basé sur la confiance : ramassez par-ci par-là ce qui est abandonné un peu partout dans la nature, pesez vos trouvailles avant d'en faire bon usage (jeter à la poubelle ce qui doit être jeté, mettez au recyclage ce qui peut être recyclé, donnez ce qui peut être réparé, etc.
  Envoyez nous au plus tard le 30.09.2020 le cumule en kg de tout ce que vous avez ramassé dans la nature pendant le mois. Des lots sont à gagner pour celles et ceux qui auront ramassé le plus de déchets !",
  seats: 50,
  seats_left: 50,
  address: "13 Place du Pont Neuf, 75001 Paris",
  ngo_id: ngo_1.id
)
event_1.tag_list = "Environnement"
event_1.save
img1 = URI.open('https://media.paperblog.fr/i/183/1831965/association-japonaise-mene-operation-ramassag-L-1.jpeg')
event_1.photo.attach(io: img1, filename: "event_#{event_1.id}.jpg", content_type: "image/jpeg")

puts "Event #{event_1.name} is created"

event_2 = Event.create!(
 name: "Débat autour de la protection de l'environnement",
 start_date: DateTime.new(2020,9,25,14),
 end_date: DateTime.new(2020,9,25,18),
 description: "Objectif : sensibiliser le plus grand nombre sur la protection de l'environnement et les changements climatiques. Agissons ensemble dès à présent !",
 seats: 20,
 seats_left: 20,
 address: "2 Rue Perrée, 75003 Paris",
 ngo_id: ngo_1.id
)
event_2.tag_list = "Environnement, Santé"
event_2.save
img2 = URI.open('https://blog.pollutec.com/wp-content/uploads/2020/04/1024x634_protection-de-lenvironnement.jpg')
event_2.photo.attach(io: img2, filename: "event#{event_2.id}.jpg", content_type: "image/jpg")

puts "Event #{event_2.name} created"

event_3 = Event.create!(
 name: "No Plastic Challenge !",
 start_date: DateTime.new(2020,9,5,9),
 end_date: DateTime.new(2020,9,5,12),
 description: "Cette année, 15 éco-gestes seront proposés pendant 15 jours pour réduire notre consommation de plastique et faire pression sur les fabricants. Nous avons besoin de vous, chers bénévoles, pour faire vivre notre action de sensibilsation et de mobilisation autour de la lutte contre la pollution plastique.",
 seats: 15,
 seats_left: 15,
 address: "11 Port de la Rapée, 75012 Paris",
 ngo_id: ngo_1.id
)
event_3.tag_list = "Environnement, Culture, Santé"
event_3.save
img3 = URI.open('https://www.ici-londres.com/data/img/thumbs/thaoss-no-plastic-200722-100504.jpg')
event_3.photo.attach(io: img3, filename: "event#{event_3.id}.jpg", content_type: "image/jpg")

puts "Event #{event_3.name} created"

event_4 = Event.create!(
 name: "Café citoyen",
 start_date: DateTime.new(2020,9,12,15),
 end_date: DateTime.new(2020,9,12,17),
 description: "Vous souhaitez vous engager dans une association ? Venez nous aider à organiser cette table ronde autour du service civique.",
 seats: 5,
 seats_left: 5,
 address: "6 rue de la Comète, 75007 Paris",
 ngo_id: ngo_4.id
)
event_4.tag_list = "Isolement, Précarité, Culture"
event_4.save
img4 = URI.open('https://cafedesimages.fr/wp-content/uploads/2018/01/cafe-citoyen-e1516469602783-1300x605.jpg')
event_4.photo.attach(io: img4, filename: "event#{event_4.id}.jpg", content_type: "image/jpg")

puts "Event #{event_4.name} created"

event_5 = Event.create!(
 name: "Course Odysséa Paris 2020",
 start_date: DateTime.new(2020,10,1,8),
 end_date: DateTime.new(2020,10,4,19),
 description: "Engagez-vous pour la recherche contre le cancer. Nous avons besoin de volontaires pour tenir les stands d'enregistrement et ravitaillement pour chaque journée de course.",
 seats: 50,
 seats_left: 50,
 address: "2 route de la ferme, 75012 Paris",
 ngo_id: ngo_3.id
)
event_5.tag_list = "Santé, Sport, Environnement"
event_5.save
img5 = URI.open('http://www.u-run.fr/wp-content/uploads/2015/06/10488119_1064186336943033_6425489115595270322_n.jpg')
event_5.photo.attach(io: img5, filename: "event#{event_5.id}.jpg", content_type: "image/jpg")

puts "Event #{event_5.name} created"

event_6 = Event.create!(
 name: "Aider les parisiennes à accéder à l'emploi ou à une formation",
 start_date: DateTime.new(2020,9,8,14),
 end_date: DateTime.new(2020,9,8,16),
 description: "Venez partager vos connaissances en recherche d'emploi : CV, entretien, etc. afin d'aider des femmes au chômage à reprendre confiance en elles et qu'elles puissent ainsi se démarquer dans leurs recherches.",
 seats: 10,
 seats_left: 10,
 address: "24 rue de la Solidarité, 75019 Paris",
 ngo_id: ngo_4.id
)
event_6.tag_list = "Formation, Précarité, Isolement"
event_6.save
img6 = URI.open('http://www.yonne.gouv.fr/var/ide_site/storage/images/politiques-publiques/economie-et-emploi/emploi/les-contrats-aides/96875-3-fre-FR/Les-contrats-aides_large.jpg')
event_6.photo.attach(io: img6, filename: "event#{event_6.id}.jpg", content_type: "image/jpg")

puts "Event #{event_6.name} created"

event_7 = Event.create!(
 name: "L dans ma ville",
 start_date: DateTime.new(2020,9,13,10),
 end_date: DateTime.new(2020,9,13,12),
 description: "Venez encadrer un cours de danse pour de jeunes adolescentes dans des quartiers défavorisés.
Toutes les jeunes de notre centre ont un bon niveau de danse (notamment en hip hop) et ont hâte de pouvoir pratiquer à nouveau. Nh'ésitez pas à les surprendre en intégrant des pas d'autres danses !",
 seats: 5,
 seats_left: 5,
 address: "50 rue Rambuteau, 75003 Paris",
 ngo_id: ngo_2.id
)
event_7.tag_list = "Jeunesse, Sport, Isolement, Santé, Culture"
event_7.save
img7 = URI.open('https://shoelifer.com/wp-content/uploads/2019/10/Shoelifer-Une-spot-beaute-studio-7-danse-urbaine-hip-hop-casablanca-2019.jpg')
event_7.photo.attach(io: img7, filename: "event#{event_7.id}.jpg", content_type: "image/jpg")

puts "Event #{event_7.name} created"

event_8 = Event.create!(
 name: "Balle de Match",
 start_date: DateTime.new(2020,9,6,14),
 end_date: DateTime.new(2020,9,6,18),
 description: "Donnez des cours de tennis pour de jeunes débutants. La quasi totalité des participants n'a jamais eu la chance de pouvoir jouer au tennis, aussi ce cours sera pour eux une initiation dont le but est qu'ils s'amusent et se créent de beaux souvenirs !
Nous vous fournirons tout le matériel nécessaire : balles, plots, raquettes pour les jeunes, bouteilles d'eau.",
 seats: 5,
 seats_left: 5,
 address: "101 rue de la station, 93700 Drancy",
 ngo_id: ngo_2.id
)
event_8.tag_list = "Jeunesse, Santé, Sport"
event_8.save
img8 = URI.open('https://www.fft.fr/sites/default/files/styles/image_16_9/public/20180623_cf_fs_0057_web.jpg?h=18143cfe&itok=_0-9b92k')
event_8.photo.attach(io: img8, filename: "event#{event_8.id}.jpg", content_type: "image/jpg")

puts "Event #{event_8.name} created"

event_9 = Event.create!(
 name: "Journée Portes Ouvertes au Refuge",
 start_date: DateTime.new(2020,9,26,10),
 end_date: DateTime.new(2020,9,26,19),
 description: "Le Club de Défense des Animaux ouvre ses portes ! Cette journée sera l'occasion de présenter nos petits pensionnaires au public afin qu'ils trouvent un foyer aimant, mettre en lumière nos actions tout au long de l'année, et sensibiliser les habitants du quartier à notre cause.
Nous recherchons 10 volontaires pour nous aider pendant la journée à accueillir les visiteurs, distributer des brochures aux passants, et tout autre action qui se présentera ! Nous comptons sur votre bonne humeur pour faire de cette journée une réussite !",
 seats: 10,
 seats_left: 10,
 address: "181 avenue Daumesnil, 75012 Paris",
 ngo_id: ngo_5.id
)
event_9.tag_list = "Bien-être animal"
event_9.save
img9 = URI.open('https://res.cloudinary.com/dw5mswvza/image/upload/v1598945610/logo_club_jsyvcd.jpg')
event_9.photo.attach(io: img9, filename: "event#{event_9.id}.jpg", content_type: "image/jpg")

puts "Event #{event_9.name} created"

event_10 = Event.create!(
 name: "Maraude pour récupérer des animaux errants",
 start_date: DateTime.new(2020,9,13,18),
 end_date: DateTime.new(2020,9,13,20),
 description: "Une de nos actions principales est de récupérer des animaux errants dans la nature afin de vérifier s'ils ne sont pas perdus, et le cas échéant les soigner, stériliser, puis les garder en refuge le temps de leur trouver un nouveau foyer.
Nous irons le 13 septembre prochain dans le quartier des Olympiades et nous avons besoin de l'aide de 5 bénévoles pour nous aider à repérer des animaux et les attraper (à condition que la/le bénévole soit volontaire).",
 seats: 5,
 seats_left: 5,
 address: "93 Rue de Tolbiac, 75013 Paris",
 ngo_id: ngo_5.id
)
event_10.tag_list = "Bien-être animal"
event_10.save
img10 = URI.open('https://static.actu.fr/uploads/2019/09/25263-190912135006460-0.jpg')
event_10.photo.attach(io: img10, filename: "event#{event_10.id}.jpg", content_type: "image/jpg")

puts "Event #{event_10.name} created"

event_11 = Event.create!(
 name: "Agir pour et avec les personnes sans-abri",
 start_date: DateTime.new(2020,9,9,18),
 end_date: DateTime.new(2020,9,9,20),
 description: "La Fabrique de la Solidarité recherche 20 volontaires pour organiser des distributions de panier repas auprès des personnes sans-abri dans le quartier de la Bibliothèque François Mitterrand, afin de leur apporter un peu de réconfort et une oreille attentive à leurs besoins et éventuelles demandes de conseils afin de leur indiquer le point d'accueil le plus proche.",
 seats: 20,
 seats_left: 20,
 address: "17 Quai François Mauriac, 75013 Paris",
 ngo_id: ngo_6.id
)
event_11.tag_list = "Précarité, Isolement, Personnes âgées, Santé"
event_11.save
img11 = URI.open('https://www.leparisien.fr/resizer/MiJEwSPWDF14AntjyiVZRCyyjfs=/932x582/arc-anglerfish-eu-central-1-prod-leparisien.s3.amazonaws.com/public/37RZU7PGY7ECT27BCL47KS67YA.jpg')
event_11.photo.attach(io: img11, filename: "event#{event_11.id}.jpg", content_type: "image/jpg")

puts "Event #{event_11.name} created"

event_12 = Event.create!(
 name: "La nuit de la Solidarité",
 start_date: DateTime.new(2020,9,11,21),
 end_date: DateTime.new(2020,10,11,3),
 description: "L'objectif de ce décompte, mené avec les signataires du Pacte de lutte contre la grande exclusion et 2 000 personnes (400 professionnels et 1 700 bénévoles parisiens) a pour but de mesurer le nombre de personnes à la rue et d'améliorer la connaissance de leurs profils et de leurs besoins pour adapter les réponses proposées.",
 seats: 1700,
 seats_left: 1700,
 address: "35 Rue du Chevalier de la Barre, 75018 Paris",
 ngo_id: ngo_6.id
)
event_12.tag_list = "Isolement, Précarité, Personnes âgées, Santé"
event_12.save
img12 = URI.open('https://img.aws.la-croix.com/2019/02/14/1201002593/Si-equipes-pousse-recherche-peripheries-capitale-avait-toutefoisdhebergements-ouverts-cette-annee-24-400-contre-21-500-places-fevrier-2018_0_729_486.jpg')
event_12.photo.attach(io: img12, filename: "event#{event_12.id}.jpg", content_type: "image/jpg")

puts "Event #{event_12.name} created"

event_13 = Event.create!(
 name: "Apprentissage du vélo pour enfants défavorisés",
 start_date: DateTime.new(2020,9,6,15),
 end_date: DateTime.new(2020,9,6,18),
 description: "Nous sommes à la recherche de 3 bénévoles pour encadrer notre prochaine session d'apprentissage du vélo, dispensé à des enfants défavorisés du 18e arrondissement. Vous n'oublierez jamais la joie sur leurs visages lorsqu'ils enchaineront leurs premiers parcours sans s'arrêter !",
 seats: 3,
 seats_left: 3,
 address: "63 Rue de la Chapelle, 75018 Paris",
 ngo_id: ngo_7.id
)
event_13.tag_list = "Jeunesse, Sport, Précarité"
event_13.save
img13 = URI.open('https://res.cloudinary.com/dw5mswvza/image/upload/v1598945610/logo_davs_a4k00h.png')
event_13.photo.attach(io: img13, filename: "event#{event_13.id}.jpg", content_type: "image/png")

puts "Event #{event_13.name} created"

event_14 = Event.create!(
 name: "Sortie VTT depuis Paris avec des personnes isolées",
 start_date: DateTime.new(2020,9,27,10),
 end_date: DateTime.new(2020,9,27,15),
 description: "Vélo-Ecole Paris Sud recherche 5 volontaires pour accompagner une sortie organisée pour rompre l'isolement de personnes en difficulté. Venez partager votre bonne humeur à coups de pédalier lors de cette sortie entre Paris et Sceaux (92) qui sera l'occasion d'en découvrir plus sur notre association et sur nos membres !
Sandwiches et boissons vous seront fournis.",
 seats: 5,
 seats_left: 5,
 address: "58 Avenue Marc Sangnier, 75014 Paris",
 ngo_id: ngo_7.id
)
event_14.tag_list = "Isolement, Jeunesse, Sport"
event_14.save
img14 = URI.open('https://assodavs.files.wordpress.com/2015/02/img_0961.jpg?w=1076&h=808')
event_14.photo.attach(io: img14, filename: "event#{event_14.id}.jpg", content_type: "image/png")

puts "Event #{event_14.name} created"

event_15 = Event.create!(
 name: "Forum des associations",
 start_date: DateTime.new(2020,9,5,10),
 end_date: DateTime.new(2020,9,5,18),
 description: "La rentrée comporte aussi son lot d'événements sympathiques ! Parmi eux, les forums des associations qui permettent, à partir du 5 septembre 2020, de trouver toutes les activités à pratiquer dans l'année.
A cette occasion la Mairie de Paris recherche 50 bénévoles pour tenir les stands d'accueil et d'information du public.",
 seats: 50,
 seats_left: 50,
 address: "Place de l'Hôtel de Ville, 75004 Paris",
 ngo_id: ngo_8.id
)
event_15.tag_list = "Culture, Formation, Environnement, Santé, Jeunesse, Sport"
event_15.save
img15 = URI.open('https://res.cloudinary.com/dw5mswvza/image/upload/v1598949870/ludomobile_hmrwi4.jpg')
event_15.photo.attach(io: img15, filename: "event#{event_15.id}.jpg", content_type: "image/jpg")

puts "Event #{event_15.name} created"

event_16 = Event.create!(
 name: "Végétalisation participative",
 start_date: DateTime.new(2020,9,4,14),
 end_date: DateTime.new(2020,9,4,16),
 description: "Venez découvrir à Paris, les dispositifs de végétalisation participative. Atelier animé par un.e conseiller.ère environnement à destination des enfants et adolescents afin de leur faire découvrir le plaisir de travailler la terre et de cultiver son jardin !
Nous cherchons à ce titre l'aide de 5 bénévoles pour encadrer le groupe pendant les conférences et ateliers.",
 seats: 5,
 seats_left: 5,
 address: "41 rue Paul Belmondo, 75012 Paris",
 ngo_id: ngo_8.id
)
event_16.tag_list = "Jeunesse, Isolement, Environnement"
event_16.save
img16 = URI.open('http://les-jardiniers-a-velo.fr/wp-content/uploads/2016/02/ateliers-participatifs-jardinage-ville-habitants-appropriation-culture-developpement-durable7.jpg')
event_16.photo.attach(io: img16, filename: "event#{event_16.id}.jpg", content_type: "image/jpg")

puts "Event #{event_16.name} created"

event_17 = Event.create!(
 name: "La ludomouv citoyenne",
 start_date: DateTime.new(2020,9,1,9),
 end_date: DateTime.new(2020,9,30,18),
 description: "Neuf nouvelles ludothèques citoyennes ouvrent leurs portes, en plein air, aux familles parisiennes pour cet été particulier.
Retrouvez la ludothèque Rue Julien Lacroix animé par l'association Strataj'm: petits et grands, en famille, avec des amis, sont invités à venir profiter des nombreuses activités ludiques et de jeux, gratuits, en plein air !
Strataj'm a besoin de 15 volontaires pour animer la ludothèque sur l'ensemble de la période d'ouverture, n'hésitez plus !",
 seats: 15,
 seats_left: 15,
 address: "Parc de Belleville, Rue Julien Lacroix, 75020 Paris",
 ngo_id: ngo_8.id
)
event_17.tag_list = "Jeunesse, Environnement, Isolement, Précarité"
event_17.save
img17 = URI.open('http://crl10.net/sites/default/files/CRL10_affiche_ludomouv7_web.jpg')
event_17.photo.attach(io: img17, filename: "event#{event_17.id}.jpg", content_type: "image/jpg")

puts "Event #{event_17.name} created"

event_18 = Event.create!(
 name: "Atelier français à visée professionnelle",
 start_date: DateTime.new(2020,9,17,18),
 end_date: DateTime.new(2020,9,17,21),
 description: "Votre mission ! Autremonde est une association qui tisse du lien social avec des personnes en situation de précarité et de migration.
  Les ateliers de français à visée professionnelle ont pour objectif principal d’agir avec les personnes migrantes socialement vulnérables pour valoriser leur parcours, leurs compétences et favoriser leur insertion professionnelle.",
 seats: 5,
 seats_left: 5,
 address: "30 Rue de la Mare, 75020 Paris",
 ngo_id: ngo_9.id
)
event_18.tag_list = "Isolement, Précarité, Formation"
event_18.save
img18 = URI.open('http://www.autremonde.org/wp-content/uploads/2015/07/book.jpg')
event_18.photo.attach(io: img18, filename: "event#{event_18.id}.jpg", content_type: "image/jpg")

puts "Event #{event_18.name} created"

event_19 = Event.create!(
 name: "Bénévolat logistique livraison",
 start_date: DateTime.new(2020,1,2,9),
 end_date: DateTime.new(2020,12,31,18),
 description: "Caméléon envoie régulièrement des cartons de 1m³ aux Philippines (environ tous les 2 mois).
 Nous recherchons un bénévole véhiculé, prêt à faire le lien entre le siège de l’association (15e arr.) et le lieu de destination (16e arr.).
 Et autres missions nécessitant un véhicule. La mission nécessite de pouvoir se rendre disponible une demi journée dans le mois.",
 seats: 1,
 seats_left: 1,
 address: "32 Rue Robert Lindet, 75015 Paris",
 ngo_id: ngo_10.id
)
event_19.tag_list = "Précarité, Jeunesse, Santé"
event_19.save
img19 = URI.open('https://d1v8uc2aqxfbnw.cloudfront.net/production/associations/banners/870e632411b9edb582ec30183eccceb51a33caac.jpg?1547561604')
event_19.photo.attach(io: img19, filename: "event#{event_19.id}.jpg", content_type: "image/png")

puts "Event #{event_19.name} created"

event_20 = Event.create!(
 name: "Food Festival Philippin",
 start_date: DateTime.new(2020,10,6,12),
 end_date: DateTime.new(2020,10,6,22),
 description: "🇫🇷🇵🇭Les associations Caméléon et La Petite Manille organisent leur premier grand événement : le Food Festival Philippin à Paris !
Découvrez la cuisine et la culture des Philippines tout en soutenant l'association Caméléon Association France qui aide les enfants victimes d'abus sexuels aux Philippines et en France.
20 volontaires sont nécessaires pour pouvoir accueillir le public comme il se doit, tenir les stands de nourriture et d'activités, ainsi que toutes les autres tâches qui se présenteront.
Bonne humeur et musique garanties !",
 seats: 20,
 seats_left: 20,
 address: "200 Quai de Valmy 75010 Paris",
 ngo_id: ngo_10.id
)
event_20.tag_list = "Précarité, Jeunesse, Santé"
event_20.save
img20 = URI.open('https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-9/71807491_735085706916675_3272450348643516416_o.jpg?_nc_cat=103&_nc_sid=b386c4&_nc_ohc=wRNJdfrOnWEAX9d0UDO&_nc_ht=scontent-cdt1-1.xx&oh=5c03dd4ca175ed079ca422f3ff192f46&oe=5F71EA91')
event_20.photo.attach(io: img20, filename: "event#{event_20.id}.jpg", content_type: "image/png")

puts "Event #{event_20.name} created"

event_21 = Event.create!(
 name: "Caméléon présente 'Cari'tatoo'",
 start_date: DateTime.new(2020,10,3,11),
 end_date: DateTime.new(2020,10,3,20),
 description: "Venez découvrir la culture philipinne par le biais du  tatouage tribal traditionnel philippin !
L’objectif de cette journée de solidarité est de présenter des tatouages flashs aux personnes venues pour l’occasion. Les prix varient de 80 € à 100 € en fonction de la taille et de la complexité des motifs : tous les fonds récoltés seront reversés à Caméléon.
Nous avons besoin pour cet évènement de 10 bénévoles afin d'accueillir le public, distribuer des brochures, et superviser l'évènement dans sa globalité.
Déjeuner compris !",
 seats: 10,
 seats_left: 10,
 address: " 2 rue de Belleville, 75020 Paris",
 ngo_id: ngo_10.id
)
event_21.tag_list = "Précarité, Jeunesse, Santé"
event_21.save
img21 = URI.open('https://www.cameleon-association.org/wp-content/uploads/2020/04/Tatoo-Flash-2020-CAMELEON-1.jpg')
event_21.photo.attach(io: img21, filename: "event#{event_21.id}.jpg", content_type: "image/jpg")

puts "Event #{event_21.name} created"

event_22 = Event.create!(
 name: "Soins ponctuels aux animaux du refuge",
 start_date: DateTime.new(2020,3,1,9),
 end_date: DateTime.new(2020,12,31,18),
 description: "Notre association collecte les signalements de maltraitance animale entrant dans le cadre de la loi autorisant un retrait de l'animal, et lorsque cela est possible, nous prenons en charge les animaux sortis de maltraitance et nous en occupons jusqu’à leur adoption.
Nous avons aujourd'hui besoin d'aide pour effectuer les soins aux animaux, notamment les nourrir, les emmener en promenade, etc. Les gardes pourront être effectuées en fonction de vos disponibilités.
Nos pensionnaires sauront vous faire craquer et vous ne pourrez plus vous passer d'eux !",
 seats: 15,
 seats_left: 15,
 address: "11 rue de Lourmel 75015 Paris",
 ngo_id: ngo_11.id
)
event_22.tag_list = "Jeunesse, Santé, Sport, Formation"
event_22.save
img22 = URI.open('https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-9/118547324_2748431005442701_6320002290883210070_n.jpg?_nc_cat=101&_nc_sid=8024bb&_nc_ohc=vqVgVfi27ccAX_4DRVF&_nc_ht=scontent-cdt1-1.xx&oh=09aa9a47386ea4f906967ea9f74957f7&oe=5F744773')
event_22.photo.attach(io: img22, filename: "event#{event_22.id}.jpg", content_type: "image/png")

puts "Event #{event_22.name} created"
puts "Seeds ✅"
