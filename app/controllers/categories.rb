get '/categories/index' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  @categories = Category.all
  erb :'categories/index'
end

get '/categories/:id' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  @category = Category.find(params[:id])
  @businesses = @category.businesses
  erb :'categories/show'
end

