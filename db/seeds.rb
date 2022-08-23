# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"



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
  available_for: "Location temporaire",
  type_of_place: "Villa/Château",
  user_id: 1
)

place1_pic1 = URI.open("https://urbexsession.com/wp-content/uploads/2018/05/chateau-pierre-chanal-5.jpg")
place1.photos.attach(io: place1_pic1, filename: "pic1.jpg", content_type: "image/jpg")
place1_pic2 = URI.open("https://i.pinimg.com/736x/ca/6e/77/ca6e7739d4a060d6049893a7801146dd.jpg")
place1.photos.attach(io: place1_pic2, filename: "pic2.jpg", content_type: "image/jpg")

place1.save!


place2 = Place.new(
  title: "Hameau de Quimerc'h",
  description: "Hameau abandonné dans le Finistère, il est disponible pour tout projet de réhabilitation par une entreprise, une association ou un groupe de particuliers avec un projet concret.",
  available_for: "Projet long terme",
  type_of_place: "Hameau",
  user_id: 1
)

place2_pic1 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/%C3%89glise_de_Quimerch.jpg/1024px-%C3%89glise_de_Quimerch.jpg")
place1.photos.attach(io: place2_pic1, filename: "pic1.jpg", content_type: "image/jpg")
place2_pic2 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Quimerch_02_L%27%C3%A9glise_paroissiale_vue_du_sud.jpg/1024px-Quimerch_02_L%27%C3%A9glise_paroissiale_vue_du_sud.jpg")
place1.photos.attach(io: place2_pic2, filename: "pic2.jpg", content_type: "image/jpg")

place2.save!


place3 = Place.new(
  title: "La Fonderie, usine désaffectée proche de Rennes",
  description: "Ancienne fonderie, ce site industriel fermé depuis 30 ans est disponible à la location pour des évènements ponctuels ou pour un projet de réhabilitation par une entreprise industrielle qui disposera de financements attractifs de la région.",
  available_for: "Les deux",
  type_of_place: "Usine/Entrepôt",
  user_id: 1
)

place3_pic1 = URI.open("https://www.weazzy.fr/wp-content/uploads/2019/10/bretagne-urbex-fonderie-74.jpg")
place3.photos.attach(io: place3_pic1, filename: "pic1.jpg", content_type: "image/jpg")
place3_pic2 = URI.open("https://www.weazzy.fr/wp-content/uploads/2019/10/bretagne-urbex-fonderie-55.jpg")
place3.photos.attach(io: place3_pic2, filename: "pic2.jpg", content_type: "image/jpg")

place3.save!
