def current_round=(round)
  @current_round = round
end

def current_round
  @current_round
end

def current_card=(card)
  @current_card
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
