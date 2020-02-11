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

  def test_it_can_return_main_characters
  character1 = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
  character2 = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
  character3 = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
  character4 = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})

  show1 = Show.new("Knight Rider", "Glen Larson", [character1, character2])
  show2 = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [character3, character4])

    @network.add_show(show1)
    @network.add_show(show2)

    assert_equal [character1, character2, character3, character4], @network.main_characters
  end

  def test_actors_by_show
    character1 = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    character2 = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    character3 = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    character4 = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})

    show1 = Show.new("Knight Rider", "Glen Larson", [character1, character2])
    show2 = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [character3, character4])

    @network.add_show(show1)
    @network.add_show(show2)

    expected = {:show1 => [character1, character2], :show2 => [character3, character4]}

    assert_equal expected, @network.actors_by_show

  end


end
