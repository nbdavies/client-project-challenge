require 'faker'

admin_user = User.create!(username: "neko atsume", email: "w", password: "w", admin: true)
regular_user1 = User.create!(username: "katamari damacy", email: "a", password: "a", admin: false)
regular_user2 = User.create!(username: "fartsmcgee", email: "b", password: "b", admin: false)

article1 = Article.create!(title: "first article", author: User.all.sample)

5.times do

  Version.create!(article_id: article1.id, author: User.all.sample, content: Faker::Hipster.paragraphs(5).join("\n"), published: false, image_url: "http://cdn.smosh.com/sites/default/files/ftpuploads/bloguploads/0913/band-memes-ronburgundy.jpg", image_caption: "YOOOO"  )
end

Version.create!(article_id: article1.id, author: User.all.sample, content: Faker::Hipster.paragraphs(5).join("\n"), published: true, image_url: "https://imgflip.com/s/meme/Creepy-Condescending-Wonka.jpg", image_caption: "This is Sparta"  )

pokemons = ["pikachu","charmander","squirtle","geodude","jynx","eevee","abra","ponyta","poliwag", "alakazam", "nidoran", "charizard", "zapdos", 'magmar', "vulpix", "weedle", "jigglypuff", "machop", "machamp", "haunter", "ditto", "bulbasaur", "dragonite", "pidgey", "nick", "kirby", "ice climbers", "team rocket", "ash", "muk"]
pokemon_image = ["https://images-na.ssl-images-amazon.com/images/G/01/videogames/detail-page/pokemon.blk-wte.oshawatt.lg.jpg", "http://blogs-images.forbes.com/davidewalt/files/2012/10/pikachu-pokemon.png", "http://img12.deviantart.net/50fb/i/2010/163/5/5/pokemon_traces_007_squirtle_by_riseagainstlife.jpg"]
pokemons.each do |pokemon|
  article = Article.create!(title: pokemon, author: User.all.sample)
    2.times do
    Version.create!(article_id: article.id, author: User.all.sample, content: Faker::Hipster.paragraphs(5).join("\n"), published: false, draft: true, image_url: pokemon_image.sample, image_caption: "YOOOO" )
    end
    1.times do
    Version.create!(article_id: article.id, author: User.all.sample, content: Faker::Hipster.paragraphs(5).join("\n"), published: true, draft: false, image_url: pokemon_image.sample, image_caption: "GRAVY!"  )
    end
end

pokemon_categories = ["ground", "ghost", "psychic", "flying", "bug", "???", "poison", "water", "fighting", "grass"]
pokemon_categories.each do |category|
  Category.create!(name: category)
end

16.times do
  Categorization.create!(category: Category.all.sample, version: Version.all.sample)
end

