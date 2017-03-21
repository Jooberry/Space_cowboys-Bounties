require('pg')

class Bounty

  attr_writer :name, :danger_level, :homeworld, :favourite_weapon

  def initialize(options)
    @id = options["id"].to_i
    @name = options['name']
    @danger_level = options['danger_level']
    @homeworld = options['homeworld']
    @favourite_weapon = options['favourite_weapon']
  end

  # def save()
  #   db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
  end



end