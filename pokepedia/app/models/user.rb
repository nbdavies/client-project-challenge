class User < ActiveRecord::Base
  has_many :articles
  has_many :versions, foreign_key: :author_id
  has_many :edited_articles, through: :versions, source: :articles
  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
end
