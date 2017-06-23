class Guess < ApplicationRecord
  # Associations
  belongs_to :card
  belongs_to :round

  # Validations
  validates :card_id, presence: true
  validates :round_id, presence: true
  validates :result, presence: true
end
