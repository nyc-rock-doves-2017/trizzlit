get '/guesses/new' do
  # round = current_round
  # current_card = round.pick_a_card
  p "^"*100
  p "THIS IS WHAT I KNOW"
  p current_round
  p current_round.pick_a_card
  redirect to card with the guest
end

post '/guesses' do
  current_round.guesses.create(card_id: current_card.id, result: "win")
  "TEST"

  redirect them to the answer page 
end
