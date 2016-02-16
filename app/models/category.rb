class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :versions, through: :categorizations
  validates :name, presence: true, uniqueness: true
end
