class Pokemon
  attr_accessor :name, :type, :db, :id
  # attr_reader :id
  def initialize(keywords)
  end
  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
  end
  def self.find(rec_id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [rec_id])
    rec = self.new(pokemon)
    rec.id = pokemon[0][0]
    rec.name = pokemon[0][1]
    rec.type = pokemon[0][2]
    return rec
  end
end
