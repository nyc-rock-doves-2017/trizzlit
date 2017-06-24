get '/rounds/new' do
  @deck_id = params[:id]
  erb :'rounds/preview'
end
