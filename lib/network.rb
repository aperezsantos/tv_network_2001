
class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    @shows.flat_map do |show|
      show.characters
    end
  end

  # def actors_by_show
  #   # for each show, create a hash?
  #   @shows.each do |show|
  #     require "pry"; binding.pry
  #     (key?) = show.characters
  #   end
  #   #   the key should be the show
  #   #   the value should be an array of it's characters
  # end

end
