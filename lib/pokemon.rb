
class Pokemon
  attr_accessor :name, :id, :type, :id, :db, :hp
  @@all = []

  def initialize(pokemon)
    @@all  << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", [name], [type])
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?;", [id])
    newpokemon = self.new(pokemon)
    newpokemon.id = pokemon[0][0]
    newpokemon.name = pokemon[0][1]
    newpokemon.type = pokemon[0][2]
    newpokemon.hp = pokemon[0][3]
    newpokemon
  end

  def alter_hp(num, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [num], [self.id])
    self.hp = num
  end
end