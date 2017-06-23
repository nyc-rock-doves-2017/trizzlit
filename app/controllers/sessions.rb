get '/sessions/new' do
end

post '/sessions' do
  if User.authenticate(params[:user])
  session[:user_id] = User.find_by(username: params[:user][:username]).id
  redirect '/suggestions'
  else
    "Login Failed"
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
