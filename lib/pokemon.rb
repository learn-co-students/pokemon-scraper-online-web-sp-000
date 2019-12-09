class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type) #pulling from initialize
    return self
  end

  def self.new_from_db(row, db)
    Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
  end

  def self.find(id, db)
    pokemon_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    new_from_db(pokemon_data[0], db)
  end

end
