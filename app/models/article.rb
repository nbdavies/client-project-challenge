class Article < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  validates :title, presence: true
  validates :author, presence: true
  has_many :versions

  def self.search(search)
  	if search
    	find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  	else
    	find(:all)
  	end
  end

  def published_version
    self.versions.last if self.versions.last.published
  end
end
