require( 'pry' )
require_relative( '../models/animal.rb' )

animal_1 = Animal.new({
  'name' => 'Arf Vader',
  'type' => 'dog',
  'breed' => 'French Bulldog'
  'adoption_status' => 'false',
  'image_url' => '../public/images/animals/dogs/arf_vader.jpeg',
  'adopted' => 'false'
  })

binding.binding.pry
nil
