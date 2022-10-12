class Team < ApplicationRecord
  validates :name, presence: true
  
  belongs_to :user
  belongs_to :league
end
