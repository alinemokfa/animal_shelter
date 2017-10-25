require( 'pry' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )

Animal.delete_all()
Owner.delete_all()


owner_1 = Owner.new({
  'first_name' => 'Aline',
  'last_name' => 'Sei La',
  'address' => '14/8 Dream Road',
  'email_address' => 'aline_dream@coldmail.com',
  'phone_number' => '07566728009'
  })

owner_1.save

owner_2 = Owner.new({
  'first_name' => 'Pat',
  'last_name' => 'Doo Dis',
  'address' => '14/8 Dream Road',
  'email_address' => 'patrick_dream@coldmail.com',
  'phone_number' => '07566728008'
  })

owner_2.save

animal_1 = Animal.new({
  'name' => 'Arf Vader',
  'type' => 'dog',
  'breed' => 'French Bulldog',
  'adoption_status' => 'true',
  'image_url' => '/images/animals/dogs/arf_vader.jpeg',
  'owner_id' => owner_1.id
  })

animal_1.save()

animal_2 = Animal.new({
  'name' => 'Chew Barka',
  'type' => 'dog',
  'breed' => 'Lhasa Apso',
  'adoption_status' => 'true',
  'image_url' => '/images/animals/dogs/chew_barka.jpeg',
  'owner_id' => owner_2.id
  })

animal_2.save()



binding.pry
nil
