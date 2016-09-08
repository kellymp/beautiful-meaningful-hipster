get '/trivias' do

clue = JAPI::Trebek.category("508") # ask trebek for a random question!
object = clue.clues.sample
@question = object.question
@answer = object.answer

erb :'/trivias/show'
end

post '/trivias' do

  if params[:correct_answer].downcase == params[:answer].downcase
    redirect back
  else
    redirect :'/'
  end
end

# get '/tests' do

#   response = Unirest.get "https://faceplusplus-faceplusplus.p.mashape.com/detection/detect?attribute=glass%2Cpose%2Cgender%2Cage%2Crace%2Csmiling&url=http%3A%2F%2Fwww.faceplusplus.com%2Fwp-content%2Fthemes%2Ffaceplusplus%2Fassets%2Fimg%2Fdemo%2F3.jpg",
#   headers:{
#     "X-Mashape-Key" => "kWXO7f7h4qmsh8FCD3SIF3QIHXHMp1WifBAjsn4grjEpN9VLdJ",
#     "Accept" => "application/json"
#   }

#   # p JSON.parse(response)
#   p 'VVVVVVVVVVVVVVVVVVVVVV'
#   p response.body
#   p '^^^^^^^^^^^^^^^^^^^^^^'

# end
