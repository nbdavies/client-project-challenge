require 'faker'

admin_user = User.create!(username: "w", email: "w", password: "w", admin: true)
regular_user = User.create!(username: "a", email: "a", password: "a", admin: false)


article1 = Article.create!(title: "first article", author_id: regular_user.id)

5.times do
  Version.create!(article_id: article1.id, author_id: regular_user.id, content: Faker::Hipster.sentence, published: false, draft: false, image_url: "http://cdn.smosh.com/sites/default/files/ftpuploads/bloguploads/0913/band-memes-ronburgundy.jpg", image_caption: "YOOOO"  )
end

Version.create!(article_id: article1.id, author_id: regular_user.id, content: Faker::Hipster.sentence, published: true, draft: false, image_url: "https://imgflip.com/s/meme/Creepy-Condescending-Wonka.jpg", image_caption: "This is Sparta"  )
