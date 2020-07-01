class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
     INSERT INTO pokemon (name, type)
     VALUES (?, ?)
    SQL
    db.execute(sql, [name, type])
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    pokemon_from_db = db.execute(sql, [id]).first
    id = pokemon_from_db[0]
    name = pokemon_from_db[1]
    type = pokemon_from_db[2]
    new_pokemon = Pokemon.new(id: id, name: name, type: type, db: db)
  end

end
