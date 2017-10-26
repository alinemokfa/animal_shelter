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
  'adoption_status' => 'false',
  'image_url' => 'https://i.imgur.com/nJUwp15.jpg',
  'owner_id' => owner_1.id
  })

animal_1.save()

animal_2 = Animal.new({
  'name' => 'Chew Barka',
  'type' => 'dog',
  'breed' => 'Lhasa Apso',
  'adoption_status' => 'false',
  'image_url' => 'http://megomuseum.com/mmgallery/files/4/9/Chewbarka.jpg',
  'owner_id' => owner_2.id
  })

animal_2.save()

animal_2 = Animal.new({
  'name' => 'Neigh Bother',
  'type' => 'horse',
  'breed' => 'Camargue',
  'adoption_status' => 'false',
  'image_url' => 'https://scontent.flhr4-2.fna.fbcdn.net/v/t1.0-9/525837_10151253622428162_842597123_n.jpg?oh=20c1fd5ad46c14de84dca81abf2bf96e&oe=5A7D0DC9',
  'owner_id' => owner_2.id
  })

animal_2.save()


binding.pry
nil
