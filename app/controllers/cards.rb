# cards responsibility is to show all the cards in a deck
get '/card' do
  erb :'cards/display_card'
  # redirect '/guesses'
end

get '/card/:id' do
end

get '/card/:id/answer' do
  # comes after guesses
end

get '/cards/new' do

end

post '/card/' do

end
