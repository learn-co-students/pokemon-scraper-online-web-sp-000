class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  # Save the pokemon in the database
  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
  end

  # Return a Pokemon object based on its ID
  def self.find(id, db)
    sql = <<-SQL
    SELECT * FROM pokemon
    WHERE id = ?
    SQL

    pokemon_from_db = db.execute(sql, id)[0]
    new_pokemon = self.new(id: pokemon_from_db[0], name: pokemon_from_db[1], type: pokemon_from_db[2], db: db)
  end

end
