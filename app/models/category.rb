class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :versions, through: :categorizations
  validates :name, presence: true, uniqueness: true

  def articles
  	versions = self.versions
  	versions = versions.to_a.select! do |version|
  		version == version.article.published_version
  	end
  	versions.map! do |version|
  		version.article
  	end
  end
end
