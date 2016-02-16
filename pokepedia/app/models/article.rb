class Article < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  validates :title, presence: true
  validates :author, presence: true
end
