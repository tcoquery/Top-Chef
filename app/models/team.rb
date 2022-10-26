class Team < ApplicationRecord
  validates :name, presence: true
  
  belongs_to :user
  belongs_to :league
  belongs_to :candidate_one, class_name: "Candidate", optional: true
  belongs_to :candidate_two, class_name: "Candidate", optional: true
  belongs_to :candidate_three, class_name: "Candidate", optional: true
  belongs_to :candidate_four, class_name: "Candidate", optional: true
end
