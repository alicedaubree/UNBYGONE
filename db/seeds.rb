# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"


##

User.destroy_all
Place.destroy_all
Activity.destroy_all
PlaceActivity.destroy_all
Project.destroy_all


## Seeding local authority user

region_bretagne = User.new(
  email: "bretagne@france.com",
  password: "xxxxxx",
  password_confirmation: "xxxxxx",
  local_authority: true,
  authority_name: "Région Bretagne"

)

authority_logo = URI.open("http://fundit.fr/sites/default/files/actors/3472-region-bretagne.png")

region_bretagne.photo.attach(io: authority_logo, filename: "profile.png", content_type: "image/png")
region_bretagne.save

## Seeding second local authority user

dpt_tarn = User.new(
  email: "tarn@departement.com",
  password: "xxxxxx",
  password_confirmation: "xxxxxx",
  local_authority: true,
  authority_name: "Conseil départemental du Tarn"

)

authority_logo = URI.open("https://upload.wikimedia.org/wikipedia/fr/thumb/1/1e/Logo_D%C3%A9partement_Tarn_2019.svg/800px-Logo_D%C3%A9partement_Tarn_2019.svg.png")

dpt_tarn.photo.attach(io: authority_logo, filename: "profile.png", content_type: "image/png")
dpt_tarn.save

## Seeding regular user

particulier = User.new(
  email: "jean@paul.com",
  password: "xxxxxx",
  password_confirmation: "xxxxxx",
  local_authority: false,
  first_name: "Jean",
  last_name: "Paul"
)

profile_pic = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/John_Paul_II.jpg/1200px-John_Paul_II.jpg")

particulier.photo.attach(io: profile_pic, filename: "profile.jpg", content_type: "image/jpg")

particulier.save


user_evan = User.new(
  email: "evan@evan.com",
  password: "xxxxxx",
  password_confirmation: "xxxxxx",
  local_authority: false,
  first_name: "Evan",
  last_name: "Abaella"
)

profile_pic = URI.open("https://i.imgur.com/KvGhU6H.jpg")

user_evan.photo.attach(io: profile_pic, filename: "profile.jpg", content_type: "image/jpg")

user_evan.save


user_silvia = User.new(
  email: "silvia@silvia.com",
  password: "xxxxxx",
  password_confirmation: "xxxxxx",
  local_authority: false,
  first_name: "Silvia",
  last_name: "Pasini"
)

profile_pic = URI.open("https://i.imgur.com/PSEZuno.jpg")

user_silvia.photo.attach(io: profile_pic, filename: "profile.jpg", content_type: "image/jpg")

user_silvia.save



user_olivier = User.new(
  email: "olivier@olivier.com",
  password: "xxxxxx",
  password_confirmation: "xxxxxx",
  local_authority: false,
  first_name: "Olivier",
  last_name: "Barthelemy"
)

profile_pic = URI.open("https://i.imgur.com/V2OjIT9.jpg")

user_olivier.photo.attach(io: profile_pic, filename: "profile.jpg", content_type: "image/jpg")

user_olivier.save







## Seeding places


place1 = Place.new(
  title: "Château Pierre Chanal",
  description: "Situé dans un domaine breton, en bordure de rivière, se trouve un magnifique château abandonné. Il est disponible à la location temporaire pour un tournage ou un évènement ponctuel.",
  available_for: "⌛ Location temporaire",
  type_of_place: "🏰 Villa/Château",
  user_id: region_bretagne.id,
  address: "29610 Garlan"
)

place1_pic1 = URI.open("https://urbexsession.com/wp-content/uploads/2018/05/chateau-pierre-chanal-5.jpg")
place1.photos.attach(io: place1_pic1, filename: "pic1.jpg", content_type: "image/jpg")
place1_pic2 = URI.open("https://i.pinimg.com/736x/ca/6e/77/ca6e7739d4a060d6049893a7801146dd.jpg")
place1.photos.attach(io: place1_pic2, filename: "pic2.jpg", content_type: "image/jpg")

place1.save!

place2 = Place.new(
  title: "Hameau de Quimerch",
  description: "Hameau abandonné dans le Finistère, il est disponible pour tout projet de réhabilitation par une entreprise, une association ou un groupe de particuliers avec un projet concret.",
  available_for: "🏗️ Projet long terme",
  type_of_place: "🏘️ Hameau",
  user_id: region_bretagne.id,
  address: "Hameau de Kéléron, 29710 Plogastel-Saint-Germain"
)

place2_pic1 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/%C3%89glise_de_Quimerch.jpg/1024px-%C3%89glise_de_Quimerch.jpg")
place2.photos.attach(io: place2_pic1, filename: "pic3.jpg", content_type: "image/jpg")
place2_pic2 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Quimerch_02_L%27%C3%A9glise_paroissiale_vue_du_sud.jpg/1024px-Quimerch_02_L%27%C3%A9glise_paroissiale_vue_du_sud.jpg")
place2.photos.attach(io: place2_pic2, filename: "pic4.jpg", content_type: "image/jpg")

place2.save!


place3 = Place.new(
  title: "La Fonderie, usine désaffectée",
  description: "Ancienne fonderie, ce site industriel fermé depuis 30 ans est disponible à la location pour des évènements ponctuels ou pour un projet de réhabilitation par une entreprise industrielle qui disposera de financements attractifs de la région.",
  available_for: "🕺 Les deux",
  type_of_place: "🏭 Usine/Entrepôt",
  user_id: region_bretagne.id,
  address: "5 Rue des Bouvreuils, 35530 Servon-sur-Vilaine"
)

place3_pic1 = URI.open("https://www.weazzy.fr/wp-content/uploads/2019/10/bretagne-urbex-fonderie-74.jpg")
place3.photos.attach(io: place3_pic1, filename: "pic5.jpg", content_type: "image/jpg")
place3_pic2 = URI.open("https://www.weazzy.fr/wp-content/uploads/2019/10/bretagne-urbex-fonderie-55.jpg")
place3.photos.attach(io: place3_pic2, filename: "pic6.jpg", content_type: "image/jpg")

place3.save!



place4 = Place.new(
  title: "Le Lavoir à charbon de Carmaux",
  description: "Patrimoine industriel emblématique haut de 7 étages, le lavoir à charbon de Carmaux a été inauguré en 1928 et a fermé à la fin des années 90. Il est aujourd'hui interdit d'accès pour raisons de sécurité, mais est prêt à être cédé pour accueillir un projet de reprise industrielle d'envergure. Le département offre une aide financière conséquente pour participer aux travaux de désamiantage.",
  available_for: "🏗️ Projet long terme",
  type_of_place: "🏭 Usine/Entrepôt",
  user_id: dpt_tarn.id,
  address: "Rue Hoche, 81400 Carmaux"
)

place4_pic1 = URI.open("https://urbexsession.com/wp-content/uploads/2022/03/lavoir-a-charbon-de-carmaux-blaye-les-mines-7.jpg")
place4.photos.attach(io: place4_pic1, filename: "pic5.jpg", content_type: "image/jpg")
place4_pic2 = URI.open("https://urbexsession.com/wp-content/uploads/2022/03/lavoir-a-charbon-de-carmaux-blaye-les-mines-13.jpg")
place4.photos.attach(io: place4_pic2, filename: "pic6.jpg", content_type: "image/jpg")

place4.save!



place5 = Place.new(
  title: "Château Tremeau",
  description: "Ce domaine érigé sous Louis XIV inscrit partiellement au titre des monuments historiques a été racheté dans les années 1970 par un riche industriel Allemand qui pendant des dizaines d'années a recherché des fonds pour le réhabiliter. Aujourd'hui la propriété du déparement, il sera le cadre idéal pour vos évènements. Tout locataire devra suivre une formation de sécurité d'une matinée dispensée gratuitement par le conseil départemental afin d'accueillir votre évènement dans les meilleures conditions.",
  available_for: "⌛ Location temporaire",
  type_of_place: "🏰 Villa/Château",
  user_id: dpt_tarn.id,
  address: "Valgros, 11150 Bram"
)

place5_pic1 = URI.open("https://urbexsession.com/wp-content/uploads/2022/03/chateau-tremeau-16.jpg")
place5.photos.attach(io: place5_pic1, filename: "pic5.jpg", content_type: "image/jpg")
place5_pic2 = URI.open("https://urbexsession.com/wp-content/uploads/2022/03/chateau-tremeau-1.jpg")
place5.photos.attach(io: place5_pic2, filename: "pic6.jpg", content_type: "image/jpg")

place5.save!

activity_1 = Activity.new(
  name: "🎬 Tournage de film",
  activity_available_for: "⌛ Location temporaire"
)
activity_1.save!

activity_2 = Activity.new(
  name: "🎉 Fête de quartier",
  activity_available_for: "⌛ Location temporaire"
)
activity_2.save!

activity_3 = Activity.new(
  name: "🎲 Jeu de rôle grandeur nature",
  activity_available_for: "⌛ Location temporaire"
)
activity_3.save!

activity_4 = Activity.new(
  name: "🛍️ Pop-up store",
  activity_available_for: "⌛ Location temporaire"
)
activity_4.save!

activity_5 = Activity.new(
  name: "🎭 Perfomance artistique",
  activity_available_for: "⌛ Location temporaire"
)
activity_5.save!

activity_10 = Activity.new(
  name: "🪀 Stage / séminaire",
  activity_available_for: "⌛ Location temporaire"
)
activity_10.save!

activity_6 = Activity.new(
  name: "🤔 Autre",
  activity_available_for: "⌛ Location temporaire"
)
activity_6.save!

activity_8 = Activity.new(
  name: "🫑 Potager de quartier",
  activity_available_for: "🏗️ Projet long terme"
)
activity_8.save!

activity_9 = Activity.new(
  name: "🛖 Résidence principale",
  activity_available_for: "🏗️ Projet long terme"
)
activity_9.save!

activity_11 = Activity.new(
  name: "🎨 Résidence d'artiste / musée",
  activity_available_for: "🏗️ Projet long terme"
)
activity_11.save!

activity_12 = Activity.new(
  name: "🍺 Bar et restaurant",
  activity_available_for: "🏗️ Projet long terme"
)
activity_12.save!

activity_13 = Activity.new(
  name: "💻 Coworking",
  activity_available_for: "🏗️ Projet long terme"
)
activity_13.save!

activity_14 = Activity.new(
  name: "😷 Lieu d'accueil médico-social",
  activity_available_for: "🏗️ Projet long terme"
)
activity_14.save!

activity_7 = Activity.new(
  name: "🤔 Autre",
  activity_available_for: "🏗️ Projet long terme"
)
activity_7.save!


place_activity1 = PlaceActivity.new(
  place_id: place1.id,
  activity_id: activity_1.id
)

place_activity1.save!


place_activity2 = PlaceActivity.new(
  place_id: place1.id,
  activity_id: activity_5.id
)

place_activity2.save!


place_activity3 = PlaceActivity.new(
  place_id: place1.id,
  activity_id: activity_3.id
)

place_activity3.save!


place_activity4 = PlaceActivity.new(
  place_id: place2.id,
  activity_id: activity_11.id
)

place_activity4.save!


place_activity5 = PlaceActivity.new(
  place_id: place2.id,
  activity_id: activity_9.id
)
place_activity5.save!


place_activity6 = PlaceActivity.new(
  place_id: place3.id,
  activity_id: activity_1.id
)
place_activity6.save!



place_activity7 = PlaceActivity.new(
  place_id: place3.id,
  activity_id: activity_14.id
)
place_activity7.save!

place_activity8 = PlaceActivity.new(
  place_id: place3.id,
  activity_id: activity_7.id
)
place_activity8.save!


place_activity9 = PlaceActivity.new(
  place_id: place4.id,
  activity_id: activity_11.id
)
place_activity9.save!


place_activity10 = PlaceActivity.new(
  place_id: place5.id,
  activity_id: activity_5.id
)
place_activity10.save!

place_activity11 = PlaceActivity.new(
  place_id: place5.id,
  activity_id: activity_10.id
)
place_activity11.save!

place_activity12 = PlaceActivity.new(
  place_id: place4.id,
  activity_id: activity_1.id
)
place_activity12.save!

place_activity13 = PlaceActivity.new(
  place_id: place4.id,
  activity_id: activity_3.id
)
place_activity13.save!

place_activity14 = PlaceActivity.new(
  place_id: place4.id,
  activity_id: activity_4.id
)
place_activity14.save!

place_activity15 = PlaceActivity.new(
  place_id: place4.id,
  activity_id: activity_5.id
)
place_activity15.save!

place_activity16 = PlaceActivity.new(
  place_id: place4.id,
  activity_id: activity_8.id
)
place_activity16.save!

place_activity17 = PlaceActivity.new(
  place_id: place4.id,
  activity_id: activity_9.id
)
place_activity17.save!

place_activity18 = PlaceActivity.new(
  place_id: place4.id,
  activity_id: activity_10.id
)
place_activity18.save!


place_activity19 = PlaceActivity.new(
  place_id: place4.id,
  activity_id: activity_12.id
)
place_activity19.save!

place_activity20 = PlaceActivity.new(
  place_id: place4.id,
  activity_id: activity_13.id
)
place_activity20.save!

place_activity21 = PlaceActivity.new(
  place_id: place4.id,
  activity_id: activity_14.id
)
place_activity21.save!

place_activity22 = PlaceActivity.new(
  place_id: place4.id,
  activity_id: activity_2.id
)
place_activity22.save!





project1 = Project.new(
  place_id: place2.id,
  user_id: user_evan.id,
  activity_id: activity_9.id,
  details: "Pourrais-je créer une secte ici ?",
  start_date: "Fri, 26 Aug 2022"
)

project1.save!


project2 = Project.new(
  place_id: place1.id,
  user_id: user_silvia.id,
  activity_id: activity_3.id,
  details: "J'ai un projet qui n'est pas vanille pour ce château !",
  start_date: "Fri, 26 Aug 2022",
  end_date: "Sun, 28 Aug 2022"
)

project2.save!
