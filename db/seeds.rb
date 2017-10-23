require( 'pry' )
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )

Animal.delete_all()
Owner.delete_all()

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
  'adoption_status' => 'true',
  'image_url' => '../public/images/animals/dogs/chew_barka.jpeg',
  'adopted' => 'false'
  })

animal_2.save()

owner_1 = Owner.new({
  'name' => 'Aline',
  'address' => '14/8 Dream Road',
  'email_address' => 'aline_dream@coldmail.com',
  'phone_number' => '07566728009'
  })

owner_1.save

owner_2 = Owner.new({
  'name' => 'Patrick',
  'address' => '14/8 Dream Road',
  'email_address' => 'patrick_dream@coldmail.com',
  'phone_number' => '07566728008'
  })

owner_2.save



binding.pry
nil
