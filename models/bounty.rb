require('pg')

class Bounty

  attr_reader :id
  attr_writer :name, :danger_level, :homeworld, :favourite_weapon

  def initialize(options)
    @id = options["id"].to_i
    @name = options['name']
    @danger_level = options['danger_level']
    @homeworld = options['homeworld']
    @favourite_weapon = options['favourite_weapon']
  end

  def save()
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "INSERT INTO space_cowboys (
    name,
    danger_level,
    homeworld,
    favourite_weapon
    ) VALUES (
    '#{@name}',
    '#{@danger_level}',
    '#{@homeworld}',
    '#{@favourite_weapon}') RETURNING *"
    @id = db.exec(sql).first()["id"].to_i
    db.close()
  end

  def delete()
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "DELETE FROM space_cowboys WHERE id = #{@id}"
    db.exec(sql)
    db.close
  end

  def update()
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "UPDATE space_cowboys 
      SET (
      name, 
      danger_level, 
      homeworld, 
      favourite_weapon) = (
      '#{@name}', 
      ' #{@danger_level}', 
      '#{@homeworld}', 
      '#{@favourite_weapon}')
      WHERE id = #{@id}"
    db.exec(sql)
    db.close()
  end

  def self.find(name)
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "SELECT * FROM space_cowboys WHERE name = '#{name}'"
    list = db.exec(sql)
    db.close
    return list.map{|bounty|Bounty.new(bounty)}
  end

  def self.find_by_id(id)
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "SELECT * FROM space_cowboys WHERE id = #{id}"
    list = db.exec(sql)
    db.close
    found = list.map{|bounty|Bounty.new(bounty)}
    return found.first
  end

  def self.delete_all()
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "DELETE FROM space_cowboys"
    db.exec(sql)
    db.close()
  end

end