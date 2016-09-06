get '/' do
  if session[:user_id]
    @user = current_user
  end
  @categories = Category.all
  erb :index
end
