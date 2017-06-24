class Round < ApplicationRecord
  # Associations
  has_many :guesses
  belongs_to :player, class_name: "User"
  belongs_to :deck

  # Validations
  validates :player_id, presence: true
  validates :deck_id, presence: true

  # Shuffle the cards for the current round
  def shuffle_the_cards(deck_id)
    @cards_in_game = self.Deck.find_by(id: deck_id).cards.shuffle
  end

  # take_last_card
  def pick_a_card
    @card = @cards_in_game.pop
  end
end
