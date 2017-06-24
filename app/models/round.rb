class Round < ApplicationRecord
  # Associations
  has_many :guesses
  belongs_to :player, class_name: "User"
  belongs_to :deck

  # Validations
  validates :player_id, presence: true
  validates :deck_id, presence: true

  def cards_in_game
    @cards_in_game ||= self.shuffle_the_cards
  end

  # Shuffle the cards for the current round
  def shuffle_the_cards
    @cards_in_game = self.deck.cards.shuffle
  end

  # take_last_card
  def pick_a_card
    self.cards_in_game.pop
  end
end
