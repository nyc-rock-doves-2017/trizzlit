get '/guesses/new' do
  current_card = current_round.pick_a_card
  erb :'guesses/new_guess'
end

post '/guesses' do
  current_round.Guesses.create(card_id: current_card.id, result= "win")
  "TEST"
end
