get '/rounds/new' do
  new_round = Round.create(player_id: current_user.id, deck_id: params[:id])
  session[:round_id] = new_round.id
  erb :'rounds/preview'
end


get '/rounds/results' do
  session[:user_id] = 1
  @results = @results.guesses
  erb :'rounds/results'
end
