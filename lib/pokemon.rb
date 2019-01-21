class Pokemon
  
  attr_accessor :id, :name, :type, :db 
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name 
    @type = type 
    @db = db
  end
    
  def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id, db)
    results = db.execute("SELECT name, type FROM pokemon WHERE id = (?)", id)
    Pokemon.new(id: id, name: results[0][0], type: results[0][1], db: db)
  end
end

