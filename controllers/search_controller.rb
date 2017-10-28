require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')

get '/search' do
  search_value = params['search_input']
  @animals = Animal.find_in_search(search_value)
  @owners = Owner.find_in_search(search_value)
  erb(:"search/results")
end

# add to layout.erb file once it's debugged
# <form class="submit" method = "get" action = "/search">
# <input type="text" name="search_input" placeholder="Search by an animal or owner field"/>
# <input type="submit" value="Search">
# </form>
