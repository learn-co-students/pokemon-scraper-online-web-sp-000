class Pokemon
    attr_reader :id, :name, :type, :db
    @@all = []
  
    def initialize (id:, name:, type:, db:)
      @id = id
      @name = name
      @type = type
      @db = db
      @@all << self
    end
  
    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end
  
    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"

        pkmn = db.execute(sql, id).flatten

        name = pkmn[1]
        type = pkmn[2]
  
        pokemon_inst = self.new(id: id, name: name, type: type, db: db)
    end
  
 
  end
  