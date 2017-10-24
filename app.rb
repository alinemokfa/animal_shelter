require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/animals_controller.rb')
require_relative('controllers/owners_controller')

get '/' do
  erb( :index )
end
