require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/owner.rb' )

get '/owners' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end

get '/owners/new' do
  erb( :"owners/new" )
end

post '/owners' do
  @owner = Owner.new(params)
  @owner.save()
  redirect to '/owners'
end

get '/owners/:id' do
  @owner = Owner.find( params[:id] )
  erb( :"owners/show" )
end

get '/owners/:id/edit' do
  @owner = Owner.find(params[:id].to_i())
  @animals = Animal.all()
  erb(:"owners/edit")
end

post '/owners/:id' do
  Owner.new(params).update()
  redirect to '/owners'
end

post '/owners/:id/delete' do
  owner = Owner.find(params[:id])
  owner.delete()
  redirect to '/owners'
end
