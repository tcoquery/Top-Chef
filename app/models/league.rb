class League < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  belongs_to :admin, class_name: "User"
end
