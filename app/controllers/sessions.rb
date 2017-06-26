get '/sessions/new' do
  erb :'/sessions/login'
end

post '/sessions' do
  if User.authenticate(params[:user])
  session[:user_id] = User.find_by(username: params[:user][:username]).id
  redirect '/'
  else
    "Login Failed"
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
