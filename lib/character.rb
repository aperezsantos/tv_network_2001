
class Character
  attr_reader :name, :actor, :salary

  def initialize(character_info)
    @character_info = character_info
    @name = character_info[:name]
    @actor = character_info[:actor]
    @salary = character_info[:salary]
  end

end
