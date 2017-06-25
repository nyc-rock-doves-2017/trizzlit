get '/decks' do 
  @decks = Deck.all

  erb :'decks/index'
end

get '/decks/new' do 

  erb :'decks/new'
end

post '/decks' do 
  @deck = Deck.new(params[:deck])
  if @deck.save
    redirect "/decks/#{@deck.id}"
  else
    @errors = @deck.errors.full_messages
    erb :'decks/new'
  end
end


get '/decks/:id' do
  @deck = Deck.find(params[:id])

  erb :'decks/show'
end
