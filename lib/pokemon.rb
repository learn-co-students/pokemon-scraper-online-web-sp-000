class Pokemon

attr_accessor :name, :type, :db, :id


def initialize(name)
  @id = nil
  @type = nil
  @db = nil
  @name = name
end

def self.save(name, type, db)
  new_pokemon=self.new(name)
  new_pokemon.type = type
  sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?,?)
  SQL
  db.execute(sql, new_pokemon.name, new_pokemon.type)
  new_pokemon.id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
end

def self.find(id,db)
  sql = <<-SQL
    SELECT *
    FROM pokemon
    WHERE id = ?
    LIMIT 1
  SQL
  row = db.execute(sql, id)
  new_pokemon = self.new(row[0][1])
  new_pokemon.id = row[0][0]
  new_pokemon.type = row[0][2]
  new_pokemon
  end





end
