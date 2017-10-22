require( 'pry' )
require_relative( '../models/animal.rb' )

Animal.delete_all()

animal_1 = Animal.new({
  'name' => 'Arf Vader',
  'type' => 'dog',
  'breed' => 'French Bulldog',
  'adoption_status' => 'false',
  'image_url' => '../public/images/animals/dogs/arf_vader.jpeg',
  'adopted' => 'false'
  })

animal_1.save()

animal_2 = Animal.new({
  'name' => 'Chew Barka',
  'type' => 'dog',
  'breed' => 'Lhasa Apso',
  'adoption_status' => 'false',
  'image_url' => '../public/images/animals/dogs/chew_barka.jpeg',
  'adopted' => 'false'
  })

animal_2.save()

binding.pry
nil
