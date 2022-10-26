class Team < ApplicationRecord
  validates :name, presence: true
  
  belongs_to :user
  belongs_to :league
  has_one :candidate_one, class_name: "Candidate"
  has_one :candidate_two, class_name: "Candidate"
  has_one :candidate_three, class_name: "Candidate"
  has_one :candidate_four, class_name: "Candidate"
end
