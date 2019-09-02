class Pokemon
  attr_accessor :id, :name, :type, :db

def initialize(keywords)

end

def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
end
def self.find(id, db)
  sql = <<-SQL
  SELECT * FROM pokemon WHERE id = ?
  SQL
  pokemon = db.execute(sql, id)
    poke = self.new(pokemon)
    poke.id = pokemon[0][0]
    poke.name = pokemon[0][1]
    poke.type = pokemon[0][2]
    poke
end


end
