get '/businesses/:id' do
  @business = Business.find(params[:id])
  @reviews = @business.reviews
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  erb :'businesses/show'
end

get '/businesses/:id/reviews/new' do
  if session[:user_id]
    @business = Business.find(params[:id])
    erb :'reviews/new'
  else
    erb :'sessions/new'
  end
end

post '/businesses/:id/reviews/new' do
  if session[:user_id]
    @business = Business.find(params[:id])
    @review = Review.new(
      user_id: session[:user_id],
      business_id: params[:id],
      review: params[:review_text],
      rating: params[:rating].to_i
      )

    if @review.save
      redirect "/businesses/#{@business.id}"
    else
      @errors = @review.errors.full_messages
      erb :'reviews/new'
    end

  else
    erb :'sessions/new'
  end
end
