get '/rounds/new' do
  # Store the round in the helper method
  new_round = Round.create(player_id: current_user.id, deck_id: params[:id])
  session[:round_id] = new_round.id
  erb :'rounds/preview'
end
