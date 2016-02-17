class Article < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  validates :title, presence: true
  validates :author, presence: true
  has_many :versions
  accepts_nested_attributes_for :author

  def self.search(search)
  	if search
    	self.where(['title LIKE ?', "%#{search}%"])
  	else
    	self.all
  	end
  end

  def published_version
    if self.versions.any?
      self.versions.last if self.versions.last.published
    end
  end

  def self.published
  	self.all.select do |article|
  		self.published_version
  	end
  end
end
