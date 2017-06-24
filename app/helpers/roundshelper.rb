def current_round
  p "You reached the current round method"
  round_id = session[:round_id]
  Round.find_by(id: round_id)
end

def current_card=(card)
  @current_card = card
end

def current_card
  @current_card
end

=begin
Rounds logic
User goes to the rounds page
User clicks next (get) and sees a card
User types an answer (post) and this is where their result needs to be updated in guesses
User sees what the answer should have been
User goes to the next page
=end
