get '/users/new' do
  erb :'users/new'
end

post '/users' do
  new_account = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password]
    )
  if params[:password] == params[:password2] && params[:password].length > 5

    if new_account.save
      session[:user_id] = new_account.id
      redirect '/'
    else
      @errors = new_account.errors.full_messages
      erb :'users/new'
    end

  else
    new_account.validate
    @errors = new_account.errors.full_messages
    @errors << "Invalid Passwords: Must Match And Have 6 or More Characters"
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find(session[:user_id])
  if @user.reviews
    @reviews = @user.reviews
  end
  erb :'users/show'
end
