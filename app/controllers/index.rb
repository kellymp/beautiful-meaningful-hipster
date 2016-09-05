get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  @categories = Category.all
  erb :index
end
