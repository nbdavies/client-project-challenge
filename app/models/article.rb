class Article < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  validates :title, presence: true
  validates :author, presence: true
  has_many :versions
  accepts_nested_attributes_for :versions

  def published_version
    self.versions.last if self.versions.last.published
  end
end
