# def initialize(id: nil, name:, type:, db:)
#   @id = id
#   @name = name
#   @type = type
#   @db = db
# end
class Pokemon

attr_accessor :id, :name, :type, :db

 def initialize (keywords)
  #  binding.pry
# def initialize(id: nil, name: nil, type: nil, db: nil)
#   @id = id
#   @name = name
#   @type = type
end

def self.find(record_id, db)
  sql = <<-SQL
  SELECT * FROM pokemon
  WHERE id = ?
  SQL
  selected_pokemon = db.execute(sql, [record_id])
  pokemon_object = Pokemon.new(selected_pokemon)
  pokemon_object.id = selected_pokemon[0][0]
  pokemon_object.name = selected_pokemon[0][1]
  pokemon_object.type = selected_pokemon[0][2]
  pokemon_object
  # binding.pry

end

def self.save(name, type, db)
  sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
  SQL
  db.execute(sql, name, type)
end

# @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]

end
