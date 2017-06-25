get '/guesses/new' do
  @current_card = current_round.pick_a_card

  # Create a new record for the guess
  current_round.guesses.create({
    card_id: @current_card.id,
    result: "No result"
    })

  redirect "/cards/#{@current_card.id}"
end

# If the card doesn't exist, they don't get to store the result
post '/guesses' do
  if !card_exists?
    redirect "/cards/#{@current_card.id}"
  else
    guess_result = result_message(params[:answer])
    current_round.guesses.create({
      card_id: current_card.id,
      result: guess_result
      })
    redirect "/cards/#{@current_card.id}/answer"
  end
  # redirect them to the answer page
end
