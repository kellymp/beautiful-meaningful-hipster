helpers do

  def current_user
    @cached_user ||= User.find(session[:user_id])
  end

  def all_categories
    Category.all
  end

end
