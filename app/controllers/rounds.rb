get '/rounds/new' do
  # Store the round in the helper method
  current_round = Round.new(player_id: current_user.id, deck_id: deck_id)
  current_round.shuffle_the_cards
  erb :'rounds/preview'
end
