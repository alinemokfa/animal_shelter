require 'minitest/autorun'
require_relative '../models/owner.rb'

class TestOwner < Minitest::Test

  def setup
      @owner = Owner.new({
        'first_name' => 'Rose',
        'last_name' => 'Smith',
        'image_url' => 'https://pixabay.com/get/e834b90f20f0063ed1534705fb0938c9bd22ffd41cb1184196f9c678a3/african-american-1180847_1920.jpg',
        'address' => '14/8 Dream Road',
        'email_address' => 'rose_dream@coldmail.com',
        'phone_number' => '07566728009'
        })
  end

  def test_pretty_name
     assert_equal( 'Rose Smith', @owner.pretty_name() )
   end

end
