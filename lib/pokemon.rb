class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)      #keyword arugments
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(num, db)
    poke_info = db.execute("SELECT * FROM pokemon WHERE id=?", num).first
    #Pokemon.new(pokemon_info, db)
    Pokemon.new(id: poke_info[0], name: poke_info[1], type: poke_info[2], db: db)
  end
end
