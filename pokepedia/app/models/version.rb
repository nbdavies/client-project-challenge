class Version < ActiveRecord::Base
  belongs_to :article
  belongs_to :author, class_name: "User"
  has_many :categorizations
  has_many :categories, through: :categorizations
  validates :article, presence: true
  validates :author, presence: true
end
