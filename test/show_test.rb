require 'minitest/autorun'
require 'minitest/pride'
require './lib/show'
require './lib/character'

class ShowTest < Minitest::Test
  def setup
    @character1 = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @character2 = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @show = Show.new("Knight Rider", "Glen Larson", [@character2, @character1])

    assert_instance_of Show, @show
  end

  def test_it_has_attributes

    assert_equal "Knight Rider", @show.name
    assert_equal "Glen Larson", @show.creator
    assert_equal [@character2, @character1], @show.characters
  end

  def test_total_salary

    assert_equal 2600000, @show.total_salary
  end

  def test_highest_paid_actor

    assert_equal "David Hasselhoff", @show.highest_paid_actor
  end

  # pry(main)> show.actors
  # # => ["David Hasselhoff", "William Daniels"]

end
