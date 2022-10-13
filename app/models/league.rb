class League < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :users
  belongs_to :admin, class_name: "User"
end
