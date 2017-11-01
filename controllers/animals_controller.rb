require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )

get '/animals' do
  if params['q']
    @animals = Animal.find_in_search(params['q'])
  else
    @animals = Animal.all()
  end
  erb ( :"animals/index" )
end

get '/animals/new' do
  erb( :"animals/new" )
end

post '/animals' do
  @animal = Animal.new(params)
  @animal.save()
  redirect to '/animals'
end

get '/animals/:id' do # show
  @animal = Animal.find( params[:id] )
  erb( :"animals/show" )
end

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id].to_i())
  @owners = Owner.all()
  erb(:"animals/edit")
end

post '/animals/:id' do
  Animal.new(params).update()
  redirect to '/animals'
end

post '/animals/:id/delete' do
  animal = Animal.find(params[:id])
  animal.delete()
  redirect to '/animals'
end
