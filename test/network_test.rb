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

  def test_it_can_add_shows
    character1 = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    character2 = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    character3 = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    character4 = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})

    show1 = Show.new("Knight Rider", "Glen Larson", [character2, character1])
    show2 = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [character3, character4])

    @network.add_show(show1)
    @network.add_show(show2)

    assert_equal [show1, show2], @network.shows
  end


end
