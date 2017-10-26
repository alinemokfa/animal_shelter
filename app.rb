require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/animals_controller.rb')
require_relative('controllers/owners_controller.rb')
require_relative('controllers/adoptions_controller.rb')
require_relative('controllers/search_controller.rb')

get '/' do
  erb( :home )
end
