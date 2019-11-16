class Pokemon
    attr_accessor :id, :name, :type, :db

  def initialize(keyword)

  end

  def self.save(name,type,db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name,type)
  end

  def self.find(id,db)
    pokemon=db.execute("SELECT * FROM pokemon WHERE id=?",id)

    new_pok=self.new(pokemon)
    new_pok.id = pokemon[0][0]
    new_pok.name = pokemon[0][1]
    new_pok.type = pokemon[0][2]
    new_pok
  end
end