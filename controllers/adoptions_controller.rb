require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )

get '/adoptions' do
  @animals = Animal.all()
  erb ( :"adoptions/adoptions")
end
