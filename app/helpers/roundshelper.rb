# Returns the current round from sessions
def current_round
  Round.find_by(id: session[:round_id])
end

# Look at the current round and return the last card
def last_guessed_card
  current_round.guesses.last.card_id
end

# Only keeps track of first guesses
def result_message(response)
  original_card = Card.find_by(id: last_guessed_card.id)
  if original_card.answer == response
    return "win"
  else
    return "lose"
  end
end

# Returns true/false depending on if the card exists
def card_exists?(card_to_check)
  if !Card.find_by(id: card_to_check.id).nil?
    return true
  else
    return false
  end
end
=begin
Rounds logic
  User goes to the rounds page, which lets them start the game
  User clicks next (get) and sees a card
    - In the background, the Round object comes up with a random card and
    - the Guess controller takes that and creates a new guess with the info
    - Guess controller redirects the user to the appropriate card
  User types an answer (post) and gets redirected to the Guess to process answer
    - Guesses updates the result in the last guess for the current round by
    comparing the answer to the original card
    - The guess post round redirects to the Card Controller to show the answer
  User sees what the answer should have been and can click next to go to the
  next page
    - This actually goes to the Guess controller who uses this information to
    - figure out which card to show the user
=end
