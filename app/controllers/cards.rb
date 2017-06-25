# cards responsibility is to show all the cards in a deck
get '/cards/:id' do
  # @current_card = last_guessed_card
  p ""
  p session
  erb :'cards/display_card'
end


get '/cards/:id/answer' do
  erb :'cards/answer'
end

get '/cards/new' do

end

post '/cards/' do

end
