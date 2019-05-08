class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(args)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    p_instance = Pokemon.new(id: nil, name: nil, type: nil)
    p_instance.id = id
    p_instance.name = pokemon[1]
    p_instance.type = pokemon[2]
    p_instance
  end

end
