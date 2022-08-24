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


## Seeding places


place1 = Place.new(
  title: "Château Pierre Chanal",
  description: "Situé dans un domaine breton, en bordure de rivière, se trouve un magnifique château abandonné. Il est disponible à la location temporaire pour un tournage ou un évènement ponctuel.",
  available_for: "⌛ Location temporaire",
  type_of_place: "🏰 Villa/Château",
  user_id: region_bretagne.id
  # address: "Chateau de, Kervézec, 29610 Garlan"
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
  user_id: region_bretagne.id
  # address: "Hameau de Kéléron, 29710 Plogastel-Saint-Germain"
)

place2_pic1 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/%C3%89glise_de_Quimerch.jpg/1024px-%C3%89glise_de_Quimerch.jpg")
place2.photos.attach(io: place2_pic1, filename: "pic3.jpg", content_type: "image/jpg")
place2_pic2 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Quimerch_02_L%27%C3%A9glise_paroissiale_vue_du_sud.jpg/1024px-Quimerch_02_L%27%C3%A9glise_paroissiale_vue_du_sud.jpg")
place2.photos.attach(io: place2_pic2, filename: "pic4.jpg", content_type: "image/jpg")

place2.save!


place3 = Place.new(
  title: "La Fonderie, usine désaffectée proche de Rennes",
  description: "Ancienne fonderie, ce site industriel fermé depuis 30 ans est disponible à la location pour des évènements ponctuels ou pour un projet de réhabilitation par une entreprise industrielle qui disposera de financements attractifs de la région.",
  available_for: "🕺 Les deux",
  type_of_place: "🏭 Usine/Entrepôt",
  user_id: region_bretagne.id
  # address: "5 Rue des Bouvreuils, 35530 Servon-sur-Vilaine"
)

place3_pic1 = URI.open("https://www.weazzy.fr/wp-content/uploads/2019/10/bretagne-urbex-fonderie-74.jpg")
place3.photos.attach(io: place3_pic1, filename: "pic5.jpg", content_type: "image/jpg")
place3_pic2 = URI.open("https://www.weazzy.fr/wp-content/uploads/2019/10/bretagne-urbex-fonderie-55.jpg")
place3.photos.attach(io: place3_pic2, filename: "pic6.jpg", content_type: "image/jpg")

place3.save!



place4 = Place.new(
  title: "Le Lavoir à charbon de Carmaux / Blaye-les-Mines",
  description: "Patrimoine industriel emblématique haut de 7 étages, le lavoir à charbon de Carmaux a été inauguré en 1928 et a fermé à la fin des années 90. Il est aujourd'hui interdit d'accès pour raisons de sécurité, mais est prêt à être cédé pour accueillir un projet de reprise industrielle d'envergure. Le département offre une aide financière conséquente pour participer aux travaux de désamiantage.",
  available_for: "🏗️ Projet long terme",
  type_of_place: "🏭 Usine/Entrepôt",
  user_id: dpt_tarn.id
  # address: "Rue Hoche, 81400 Carmaux"
)

place4_pic1 = URI.open("https://urbexsession.com/wp-content/uploads/2022/03/lavoir-a-charbon-de-carmaux-blaye-les-mines-7.jpg")
place4.photos.attach(io: place4_pic1, filename: "pic5.jpg", content_type: "image/jpg")
place4_pic2 = URI.open("https://urbexsession.com/wp-content/uploads/2022/03/lavoir-a-charbon-de-carmaux-blaye-les-mines-13.jpg")
place4.photos.attach(io: place4_pic2, filename: "pic6.jpg", content_type: "image/jpg")

place4.save!



place5 = Place.new(
  title: "Château Tremeau",
  description: "Ce domaine érigé sous Louis XIV inscrit partiellement au titre des monuments historiques a été racheté dans les années 1970 par un riche industriel Allemand qui pendant des dizaines d'années a recherché des fonds pour le réhabiliter. Aujourd'hui la propriété du déparement, il sera le cadre idéal à tout type d'évènements : tournage de film, jeu de rôle grandeur nature ... Tout locataire devra suivre une formation de sécurité d'une matinée dispensée gratuitement par le conseil départemental afin d'accueillir votre évènement dans les meilleures conditions.",
  available_for: "⌛ Location temporaire",
  type_of_place: "🏰 Villa/Château",
  user_id: dpt_tarn.id
  # address: "Valgros, 11150 Bram"
)

place5_pic1 = URI.open("https://urbexsession.com/wp-content/uploads/2022/03/chateau-tremeau-16.jpg")
place5.photos.attach(io: place5_pic1, filename: "pic5.jpg", content_type: "image/jpg")
place5_pic2 = URI.open("https://urbexsession.com/wp-content/uploads/2022/03/chateau-tremeau-1.jpg")
place5.photos.attach(io: place5_pic2, filename: "pic6.jpg", content_type: "image/jpg")

place5.save!
