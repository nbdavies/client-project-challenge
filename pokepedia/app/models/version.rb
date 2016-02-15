class Version < ActiveRecord::Base
  belongs_to :article
  belongs_to :author, class_name: "User"
  has_many :categorizations
end
