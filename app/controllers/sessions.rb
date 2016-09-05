get '/sessions/log_out' do
  session.delete(:user_id)
  erb :index
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:email], params[:password])
    session[:user_id] = @user.id
    erb :"users/#{@user.id}"
  else
    @errors = ['Invalid E-Mail or Password']
    erb :'sessions/new'
  end
end
