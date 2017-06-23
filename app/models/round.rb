class Round < ApplicationRecord
  # Associations
  has_many :guesses
  belongs_to :player, class_name: "User"
  belongs_to :deck

  # Validations
  validates :player_id, presence: true
  validates :deck_id, presence: true
end
