class Pokemon
      attr_accessor :id, :name, :type, :db
  @@all = []
  
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name
    @type = type 
    @db = db 
    @@all << self
  end 
  
  # def self.all 
  # @@all 
  # end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    
  end 
  
  def self.find(id, db)
    find_db = db.execute("SELECT pokemon.id, pokemon.name, pokemon.type FROM pokemon WHERE pokemon.id = ?", id).flatten
    
    
    
    
    @id = find_db[0]
    @name = find_db[1]
    @type = find_db[2]
    @db = db
    
    
    
    
     add_pokemon = self.new(id: find_db[0], name: find_db[1], type: find_db[2], db: db)
    
    
    
   
    
  end 
  
end