# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

p "destroying #{User.all.count} users"
p "destroying #{Car.all.count} cars"
p "destroying #{Booking.all.count} bookings"

User.destroy_all
User.all.each do |user|
  user.photo.purge
end

Car.all.each do |car|
  car.photo.purge
end

Booking.destroy_all

p "destroyed- users: users: #{User.all.count}"
p "destroyed- cars: #{Car.all.count}"
p "destroyed- bookings: #{Booking.all.count}"

p "number of users"
p User.count

p "number of cars"
p Car.count

p "number of bookings"
p Booking.count

user_owner = User.new(
  email: 'anneperrine@gmail.com',
  password: 'password',
)
photo = URI.open('https://i.postimg.cc/HkJ8bCZ4/profil-photo.png')
user_owner.photo.attach(io: photo, filename: "anneperrine-photo", content_type: 'image/jpg')
user_owner.save!

car1 = Car.new(
  user: user_owner,
  brand: "Toyota",
  model: "Yaris",
  year_of_production: 2022,
  address: "5 Rue de la Liberté, Paris",
  price_per_day: 50,
  description: "La Toyota Yaris est une voiture compacte très prisée pour sa fiabilité et son efficacité énergétique. Avec son design élégant et ses fonctionnalités modernes, elle offre une expérience de conduite exceptionnelle. Idéale pour les déplacements en ville, cette voiture combine performance et économie de carburant.\n\n
  La Yaris excelle également sur les longs trajets grâce à son confort intérieur et à ses caractéristiques axées sur la sécurité. Que vous soyez un conducteur quotidien ou que vous planifiez une escapade le week-end, la Toyota Yaris est prête à répondre à vos besoins.\n\n
  Le design extérieur distinctif de la Yaris ne se contente pas d'être esthétique, il contribue également à une aérodynamique exceptionnelle, améliorant ainsi l'efficacité énergétique. Explorez la ville avec style et confiance à bord de cette voiture polyvalente et fiable.\n\n
  L'intérieur de la Yaris est conçu avec le conducteur à l'esprit, offrant des commandes intuitives et un espace bien organisé. Les sièges confortables et les fonctionnalités technologiques avancées ajoutent à l'expérience de conduite globale. Que vous appréciiez la musique en streaming pendant votre trajet ou que vous recherchiez des fonctions de sécurité avancées, la Yaris a tout pour plaire.\n\n
  En conclusion, la Toyota Yaris est bien plus qu'une simple voiture compacte. Elle incarne l'innovation, la fiabilité et l'efficacité, ce qui en fait le choix idéal pour ceux qui recherchent une expérience de conduite exceptionnelle dans toutes les situations."
)
file = URI.open("https://i.postimg.cc/3Rsyg2FZ/toyota-gr-yaris-6751752-1280.jpg")
car1.photo.attach(io: file, filename: "car", content_type: "image/jpg")
car1.save!

car2 = Car.new(
  user: user_owner,
  brand: "Honda",
  model: "Civic",
  year_of_production: 2021,
  address: "10 Avenue des Champs-Élysées, Paris",
  price_per_day: 60,
  description: "La Honda Civic est une berline polyvalente qui allie style et performance. Son intérieur spacieux et ses fonctionnalités avancées en font un choix populaire parmi les conducteurs exigeants. Que vous soyez en ville ou sur l'autoroute, la Civic offre une conduite confortable et une économie de carburant remarquable.\n\n
  Le design extérieur de la Civic combine élégance et dynamisme, avec des lignes fluides et des détails modernes. Son allure sportive attire le regard, faisant de la Civic non seulement une voiture performante mais aussi une déclaration de style.\n\n
  À l'intérieur, la Honda Civic offre un espace accueillant et des fonctionnalités avancées. Les sièges confortables et les finitions de qualité supérieure créent un environnement de conduite agréable. Les technologies embarquées, telles que l'écran tactile central et les systèmes de sécurité avancés, renforcent l'expérience globale du conducteur.\n\n
  La Civic brille également sur le plan de la performance, avec des options de moteur puissantes et une tenue de route précise. Que vous recherchiez une conduite sportive ou une efficacité énergétique maximale, la Honda Civic offre le meilleur des deux mondes.\n\n
  En conclusion, la Honda Civic incarne l'harmonie entre le style, la performance et la fonctionnalité. Que vous soyez un passionné de conduite ou à la recherche d'une voiture polyvalente pour votre vie quotidienne, la Civic répondra à vos attentes avec brio."
)
file2 = URI.open("https://i.postimg.cc/qq2NQgmH/honda-4384888-1280.jpg")
car2.photo.attach(io: file2, filename: "car2", content_type: "image/jpg")
car2.save!

car3 = Car.new(
  user: user_owner,
  brand: "Ford",
  model: "Focus",
  year_of_production: 2020,
  address: "15 Rue du Faubourg Saint-Honoré, Paris",
  price_per_day: 55,
  description: "La Ford Focus est une voiture compacte réputée pour son agilité et son plaisir de conduire. Avec un intérieur bien conçu et des technologies innovantes, la Focus offre une expérience de conduite moderne. Parfaite pour les trajets quotidiens ou les escapades le week-end.\n\n
  Son design extérieur dynamique attire l'attention, tandis que l'intérieur spacieux offre confort et polyvalence. Les caractéristiques de sécurité avancées et les technologies de divertissement embarquées font de la Focus une compagne idéale pour toutes les aventures sur la route.\n\n
  Côté performance, la Ford Focus offre une conduite agile et réactive. Les options de moteur efficaces sur le plan énergétique garantissent une expérience de conduite économique sans sacrifier le plaisir. Que vous soyez en ville ou sur l'autoroute, la Focus vous emmènera là où vous voulez aller avec style et facilité.\n\n
  En conclusion, la Ford Focus incarne l'équilibre parfait entre style, fonctionnalité et performance. Cette voiture compacte saura répondre à vos besoins, que ce soit pour des déplacements quotidiens ou des aventures spontanées."
)
file3 = URI.open("https://i.postimg.cc/0QMMMVDQ/car-3300587-1280.jpg")
car3.photo.attach(io: file3, filename: "car3", content_type: "image/jpg")
car3.save!

car4 = Car.new(
  user: user_owner,
  brand: "Volkswagen",
  model: "Golf",
  year_of_production: 2023,
  address: "20 Rue de Rivoli, Paris",
  price_per_day: 70,
  description: "La Volkswagen Golf est une référence dans le monde des compactes. Avec son design raffiné, ses caractéristiques avancées de sécurité et ses performances dynamiques, elle offre une conduite agréable. Que vous soyez en ville ou sur la route, la Golf offre polyvalence et confort.\n\n
  Le design extérieur sophistiqué de la Golf témoigne de son héritage classique, tandis que l'intérieur moderne offre des finitions de haute qualité et une attention aux détails. Les fonctionnalités technologiques, telles que l'écran tactile central et les systèmes d'assistance à la conduite, ajoutent une dimension moderne à cette voiture emblématique.\n\n
  La Golf brille également sur le plan de la performance, avec des options de moteur puissantes et une maniabilité exceptionnelle. Que vous recherchiez une conduite sportive ou une expérience plus détendue, la Volkswagen Golf s'adapte à votre style de conduite avec aisance.\n\n
  En conclusion, la Volkswagen Golf offre une combinaison harmonieuse de style intemporel, de technologies modernes et de performances fiables. Cette compacte polyvalente est prête à vous accompagner dans toutes vos aventures sur la route."
)
file4 = URI.open("https://i.postimg.cc/W4fq1BDC/automotive-1846910-1280.jpg")
car4.photo.attach(io: file4, filename: "car4", content_type: "image/jpg")
car4.save!

car5 = Car.new(
  user: user_owner,
  brand: "Chevrolet",
  model: "Malibu",
  year_of_production: 2019,
  address: "10 Rue de la République, 69002 Lyon",
  price_per_day: 45,
  description: "La Chevrolet Malibu allie style et sophistication. Avec un extérieur élégant et un intérieur confortable, elle offre une expérience de conduite luxueuse. Parfaite pour les voyages d'affaires ou les escapades en famille, la Malibu offre un équilibre parfait entre performance et élégance.\n\n
  Le design extérieur distinctif de la Malibu se marie parfaitement avec son intérieur spacieux et bien aménagé. Les matériaux de haute qualité, les sièges confortables et les fonctionnalités haut de gamme créent une atmosphère de conduite de première classe. Que vous soyez seul au volant ou en compagnie de passagers, la Malibu offre un confort exceptionnel à chaque trajet.\n\n
  Côté performance, la Chevrolet Malibu excelle avec des options de moteur puissantes et une conduite en douceur. Les caractéristiques avancées de sécurité ajoutent une tranquillité d'esprit supplémentaire à chaque kilomètre. Profitez de chaque moment sur la route avec cette berline qui redéfinit le luxe abordable.\n\n
  En conclusion, la Chevrolet Malibu offre une expérience de conduite raffinée et élégante. Cette berline séduisante est conçue pour ceux qui recherchent un mélange parfait de style, de confort et de performance."
)
file5 = URI.open("https://i.postimg.cc/WzYHWbtS/automobile-1346831-1280.jpg")
car5.photo.attach(io: file5, filename: "car5", content_type: "image/jpg")
car5.save!

car6 = Car.new(
  user: user_owner,
  brand: "Mercedes-Benz",
  model: "E-Class",
  year_of_production: 2022,
  address: "15 Rue du Val de Mayenne, 53000 Laval",
  price_per_day: 80,
  description: "La Mercedes-Benz E-Class incarne le luxe et l'innovation. Avec son design élégant, son intérieur haut de gamme et ses technologies avancées, elle offre une expérience de conduite exceptionnelle. Que vous soyez en déplacement professionnel ou en voyage de plaisir, l'E-Class offre le summum du confort.\n\n
  L'extérieur de l'E-Class marie élégance et sportivité, créant une présence sur la route qui ne passe pas inaperçue. L'intérieur raffiné offre des sièges en cuir, des équipements de pointe et une attention aux détails qui définissent le luxe moderne. Les technologies embarquées, telles que le système d'infodivertissement avancé, ajoutent une touche de sophistication à chaque trajet.\n\n
  La performance de la Mercedes-Benz E-Class est à la hauteur de son prestige, avec des moteurs puissants et une conduite souple. Les caractéristiques de sécurité de pointe assurent une tranquillité d'esprit, tandis que les innovations technologiques ajoutent une dimension supplémentaire à chaque kilomètre parcouru.\n\n
  En conclusion, la Mercedes-Benz E-Class représente l'apogée du luxe automobile. Cette berline haut de gamme offre une expérience de conduite inégalée, associant sophistication, puissance et technologie de pointe."
)
file6 = URI.open("https://i.postimg.cc/V6RTtF8x/auto-2179220-1280.jpg")
car6.photo.attach(io: file6, filename: "car6", content_type: "image/jpg")
car6.save!

car7 = Car.new(
  user: user_owner,
  brand: "Audi",
  model: "A4",
  year_of_production: 2021,
  address: "25 Quai Saint-Cast, 35000 Rennes",
  price_per_day: 65,
  description: "L'Audi A4 est une berline sportive qui allie performance et élégance. Avec son design distinctif et son intérieur sophistiqué, elle offre une conduite dynamique. Idéale pour ceux qui recherchent une expérience de conduite immersive et un style indéniable.\n\n
  L'extérieur de l'Audi A4 est un mélange harmonieux de lignes épurées et de détails expressifs. L'intérieur raffiné offre des matériaux de qualité supérieure, des finitions haut de gamme et des technologies avancées. Les sièges confortables et les fonctionnalités intuitives créent une atmosphère de conduite qui allie luxe et sportivité.\n\n
  La performance de l'Audi A4 est à la hauteur de son image, avec des options de moteur puissantes et une tenue de route agile. Les technologies avancées, telles que le système d'infodivertissement MMI et les systèmes d'assistance à la conduite, ajoutent une touche moderne à cette berline sportive.\n\n
  En conclusion, l'Audi A4 incarne l'alliance parfaite entre sportivité et sophistication. Cette berline dynamique offre une expérience de conduite excitante et un design qui ne manquera pas de captiver tous les regards sur la route."
)
file7 = URI.open("https://i.postimg.cc/mZmJ2VVM/car-604019-1280.jpg")
car7.photo.attach(io: file7, filename: "car7", content_type: "image/jpg")
car7.save!

car8 = Car.new(
  user: user_owner,
  brand: "Renault",
  model: "Clio",
  year_of_production: 2020,
  address: "10 Place du Capitole, 31000 Toulouse",
  price_per_day: 55,
  description: "La Renault Clio est une citadine moderne et polyvalente. Avec son design compact, son intérieur bien conçu et ses fonctionnalités intelligentes, elle offre une conduite urbaine sans effort. Parfaite pour naviguer dans les rues animées de la ville.\n\n
  L'extérieur de la Clio arbore un style distinctif qui se fond parfaitement dans l'environnement urbain. L'intérieur ergonomique offre un espace confortable, des fonctionnalités intuitives et une connectivité avancée. Que vous fassiez des courses en ville ou que vous partiez pour une escapade de week-end, la Clio s'adapte à votre style de vie urbain.\n\n
  La performance de la Renault Clio se manifeste dans sa maniabilité agile et sa consommation de carburant optimisée. Les fonctionnalités de sécurité avancées et les technologies embarquées ajoutent une tranquillité d'esprit supplémentaire à chaque trajet. Redécouvrez le plaisir de conduire en ville avec cette citadine polyvalente.\n\n
  En conclusion, la Renault Clio représente l'équilibre parfait entre style urbain, fonctionnalité intelligente et efficacité énergétique. Cette citadine moderne est conçue pour faciliter chaque déplacement en ville."
  )
  file8 = URI.open("https://i.postimg.cc/NFjnkrG5/clio-2460877-1280.jpg")
  car8.photo.attach(io: file8, filename: "car8", content_type: "image/jpg")
  car8.save!

p "created #{User.all.count} users"
p "created #{Car.all.count} cars"
p "created #{Booking.all.count} bookings"
