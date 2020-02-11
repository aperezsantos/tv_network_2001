require 'minitest/autorun'
require 'minitest/pride'
require './lib/network'
require './lib/show'
require './lib/character'

class NetworkTest < Minitest::Test

  def setup
    @network = Network.new("NBC")

    assert_instance_of Network, @network
  end

  def test_it_has_attributes

    assert_equal "NBC", @network.name
    assert_equal [], @network.shows
  end

end
