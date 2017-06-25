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

  # take_last_card, but keep shuffling until the guess for that card wasn't made
  def pick_a_card
    new_card = self.cards_in_game.pop
    until self.guesses.exists?(card_id: new_card.id) == false
      new_card = self.cards_in_game.pop
    end
    return new_card
  end
end

=begin
  1) guides.rubyonrails.org on "Active Record Associations"
  http://guides.rubyonrails.org/association_basics.html
=end
