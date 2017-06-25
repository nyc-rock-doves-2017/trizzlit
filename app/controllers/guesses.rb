get '/guesses/new' do
  @current_card = current_round.pick_a_card
    if @current_card.nil?
      redirect '/rounds/results'
    else
      # Create a new record for the guess
      current_round.guesses.create({
        card_id: @current_card.id,
        result: "No result"
        })
      redirect "/cards/#{@current_card.id}"
    end
end

# If the card doesn't exist, they don't get to store the result
post '/guesses' do
  guess_result = result_message(params[:user_guess])
  current_round.guesses.where(card_id: last_guessed_card).update_all({
    result: guess_result
    })
  redirect "/cards/#{last_guessed_card}/answer"
  # redirect them to the answer page
end
