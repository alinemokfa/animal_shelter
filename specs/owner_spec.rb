require 'minitest/autorun'
require_relative '../models/owner.rb'

class TestOwner < Minitest::Test

  def setup
      @owner = Owner.new({
      'first_name' => 'Aline',
      'last_name' => 'Sei La',
      'address' => '14/8 Dream Road',
      'email_address' => 'aline_dream@coldmail.com',
      'phone_number' => '07566728009'
      })
  end

  def test_pretty
     assert_equal( 'Aline Sei La', @owner.pretty_name() )
   end

end
