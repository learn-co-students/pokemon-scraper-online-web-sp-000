	class Pokemon
	
	attr_accessor :id, :name, :type, :db, :hp
	@@all = []
	
	  def initialize(name:, type:, id:, db:, hp: nil)
	    @name = name
	    @type = type
	    @id = id
	    @hp = hp
	    @db = db
	    @@all << self 
	  end
	
	  def self.save(name, type, db)
	    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
	  end
	
	  def self.find(id_number, db)
	    pokemon_from_db = db.execute("SELECT * FROM pokemon WHERE id=?", id_number).first
	    Pokemon.new(id: pokemon_from_db[0], 
	              name: pokemon_from_db[1], 
	              type: pokemon_from_db[2], 
	              hp: pokemon_from_db[3], 
	              db: db )
	  end
	
	  def alter_hp(new_hp, db)
	    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
	  end
	
	
	end