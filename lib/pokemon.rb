class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(pokemon_id, db)
    search_results = db.execute("SELECT * FROM pokemon WHERE id=?", pokemon_id).flatten
    Pokemon.new(id: search_results[0], name:search_results[1], type: search_results[2], db: db)
  end

  def alter_hp()
    
end
