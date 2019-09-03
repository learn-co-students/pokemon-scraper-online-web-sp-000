class Pokemon
  attr_accessor :id, :name, :type, :db
  #attr_reader

  def initialize(hash)

    #fix. make hash because keyword arguments are actually passed as a single hash
    puts hash
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end

end
