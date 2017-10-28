require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )

Animal.delete_all()
Owner.delete_all()


owner_1 = Owner.new({
  'first_name' => 'Rose',
  'last_name' => 'Smith',
  'image_url' => 'https://i.pinimg.com/736x/2b/dc/a4/2bdca4437360789ee3bda68e0631b167--hairstyles-for-short-hair-hairstyles-for-black-women.jpg',
  'address' => '14/8 Dream Road',
  'email_address' => 'rose_dream@coldmail.com',
  'phone_number' => '07566728009'
  })

owner_1.save

owner_2 = Owner.new({
  'first_name' => 'John',
  'last_name' => 'Campbell',
  'image_url' => 'https://images.pexels.com/photos/423364/pexels-photo-423364.jpeg',
  'address' => '15 Rose Road',
  'email_address' => 'j_c@m4rg4ret.com',
  'phone_number' => '07566728008'
  })

owner_2.save

owner_3 = Owner.new({
  'first_name' => 'David',
  'last_name' => 'Connolly',
  'image_url' => 'https://static.pexels.com/photos/334029/pexels-photo-334029.jpeg',
  'address' => '7 Dock Street',
  'email_address' => 'dee_con@warmmail.com',
  'phone_number' => '07566728666'
  })

owner_3.save

owner_4 = Owner.new({
  'first_name' => 'C',
  'last_name' => 'Marshall',
  'image_url' => 'https://cdn1.thehunt.com/app/public/system/note_images/6844531/original/23f684b1562aea9e138cc9dc8fefa6eb.jpg',
  'address' => '3 Margaret Place',
  'email_address' => 'c_mar@margaret4evah.com',
  'phone_number' => '07566728677'
  })

owner_4.save

owner_5 = Owner.new({
  'first_name' => 'Rob',
  'last_name' => 'D William',
  'image_url' => 'https://scontent.flhr4-2.fna.fbcdn.net/v/t1.0-9/19429773_10154865208178845_7060899779322054516_n.jpg?oh=3c2cc534b4eb54c2fc1c10fd23df56be&oe=5A6D9D87',
  'address' => '44 Good Vibes St',
  'email_address' => 'r_d_w@margaret4evahandevah.com',
  'phone_number' => '07566728673'
  })

owner_5.save

owner_6 = Owner.new({
  'first_name' => 'Yoni',
  'last_name' => 'Satat',
  'image_url' => 'https://pbs.twimg.com/profile_images/851757973080858625/ZL_PBIJE.jpg',
  'address' => '34 Happy Road',
  'email_address' => 'y_s@margaretrulez.com',
  'phone_number' => '07866728673'
  })

owner_6.save




animal_1 = Animal.new({
  'name' => 'Arf Vader',
  'type' => 'Dog',
  'breed' => 'French Bulldog',
  'adoption_status' => 'true',
  'image_url' => 'https://i.imgur.com/nJUwp15.jpg',
  'owner_id' => owner_1.id
  })

animal_1.save()

animal_2 = Animal.new({
  'name' => 'Chew Barka',
  'type' => 'Dog',
  'breed' => 'Lhasa Apso',
  'adoption_status' => 'true',
  'image_url' => 'http://megomuseum.com/mmgallery/files/4/9/Chewbarka.jpg',
  'owner_id' => owner_2.id
  })

animal_2.save()

animal_3 = Animal.new({
  'name' => 'Neigh Bother',
  'type' => 'Horse',
  'breed' => 'Camargue',
  'adoption_status' => 'false',
  'image_url' => 'https://scontent.flhr4-2.fna.fbcdn.net/v/t1.0-9/525837_10151253622428162_842597123_n.jpg?oh=20c1fd5ad46c14de84dca81abf2bf96e&oe=5A7D0DC9',
  'owner_id' => owner_6.id
  })

animal_3.save()

animal_4 = Animal.new({
  'name' => 'Iggy Pop',
  'type' => 'Exotic Pet',
  'breed' => 'Green Iguana',
  'adoption_status' => 'false',
  'image_url' => 'https://images.pexels.com/photos/321900/pexels-photo-321900.jpeg',
  'owner_id' => owner_4.id
  })

animal_4.save()

animal_5 = Animal.new({
  'name' => 'Pasquale Brown',
  'type' => 'Rabbit',
  'breed' => 'Holland Lop',
  'adoption_status' => 'false',
  'image_url' => 'https://static.pexels.com/photos/326012/pexels-photo-326012.jpeg',
  'owner_id' => owner_5.id
  })

animal_5.save()

animal_6 = Animal.new({
  'name' => 'Mandy',
  'type' => 'Cat',
  'breed' => 'Unkown',
  'adoption_status' => 'false',
  'image_url' => 'https://static.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg',
  'owner_id' => owner_3.id
  })

animal_6.save()
