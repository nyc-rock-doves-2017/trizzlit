get '/users/new' do
  @user = User.new
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
    if @user.save
      redirect "/"
    else
      #@errors = @user.errors.full_messages
      erb :'/users/new'
    end
end


get '/users/profile' do
  @user = User.new
  erb :'/users/profile'
end
