class Round < ApplicationRecord
  # Associations
  has_many :guesses
  belongs_to :player, class_name: "User"
  belongs_to :deck

  # Validations
  validates :player_id, presence: true
  validates :deck_id, presence: true

  # Shuffle the cards for the current round
  def shuffle_the_cards
    self.deck.cards.shuffle
  end

  def find_percentage_by(text,number=2)
    result = self.guesses.where(result: text).count/self.guesses.count.to_f
    (result * 100).round(number)
  end

  def find_percentage_for_first_attempts(number=2)
    result = (self.cards_guessed_correctly_the_first_time)/self.guesses.count.to_f
    (result * 100).round(number)
  end

  def cards_guessed_incorrectly_the_first_time
    self.guesses.select("card_id, round_id, result, count(result) as number_of_attempts").group("card_id, round_id, result").having("result = 'lose'").length
  end

  def cards_guessed_correctly_the_first_time
    (self.guesses.where(result: 'win').count - self.cards_guessed_incorrectly_the_first_time)
  end

  # take_last_card, but keep shuffling until the guess for that card wasn't made
  def pick_a_card
    @cards_in_game = shuffle_the_cards
    @answered_cards = guesses.where(result: "win").distinct
    until @cards_in_game.nil?
      new_card = @cards_in_game.pop
      new_card.nil? ? new_card_id = nil : new_card_id = new_card.id
      if self.guesses.exists?(card_id: new_card_id) == false || @answered_cards.exists?(card_id: new_card_id) == false
        return new_card
      end
    end
    return nil
  end
end

=begin
  1) guides.rubyonrails.org on "Active Record Associations"
  http://guides.rubyonrails.org/association_basics.html
  2) guides.rubyonrails.org on "Active Record Query Interface"
  http://guides.rubyonrails.org/active_record_querying.html
  3) ruby-doc.org on "Kernel"
  https://ruby-doc.org/core-2.3.3/Kernel.html
=end
