require 'faker'

admin_user = User.create!(username: "w", email: "w", password: "w", admin: true)
regular_user1 = User.create!(username: "a", email: "a", password: "a", admin: false)
regular_user2 = User.create!(username: "b", email: "b", password: "b", admin: false)

article1 = Article.create!(title: "first article", author_id: regular_user1.id)

5.times do
  Version.create!(article_id: article1.id, author_id: regular_user1.id, content: Faker::Hipster.sentence, published: false, image_url: "http://cdn.smosh.com/sites/default/files/ftpuploads/bloguploads/0913/band-memes-ronburgundy.jpg", image_caption: "YOOOO"  )
end

Version.create!(article_id: article1.id, author_id: regular_user1.id, content: Faker::Hipster.sentence, published: true, image_url: "https://imgflip.com/s/meme/Creepy-Condescending-Wonka.jpg", image_caption: "This is Sparta"  )

pokemon = ["pikachu","charmander","squirtle","geodude","jynx","eevee","abra","ponyta","poliwag"]
pokemon_image = ["https://images-na.ssl-images-amazon.com/images/G/01/videogames/detail-page/pokemon.blk-wte.oshawatt.lg.jpg", "http://blogs-images.forbes.com/davidewalt/files/2012/10/pikachu-pokemon.png", "http://img12.deviantart.net/50fb/i/2010/163/5/5/pokemon_traces_007_squirtle_by_riseagainstlife.jpg"]
6.times do
  article = Article.create!(title: pokemon.sample, author_id: regular_user2.id)
    2.times do
    Version.create!(article_id: article.id, author_id: regular_user2.id, content: Faker::Hacker.say_something_smart, published: false, draft: true, image_url: pokemon_image.sample, image_caption: "YOOOO" )
    end
        1.times do
    Version.create!(article_id: article.id, author_id: regular_user2.id, content: Faker::Hacker.say_something_smart, published: true, draft: false, image_url: pokemon_image.sample, image_caption: "GRAVY!"  )
    end
end

pokemon_categories = ["ground", "ghost", "psychic", "flying", "bug", "???", "poison", "water", "fighting", "grass"]
10.times do |i|
      Category.create!(name: pokemon_categories[i])
end

16.times do
  Categorization.create!(category_id: rand(10), version_id: rand(24))
end
