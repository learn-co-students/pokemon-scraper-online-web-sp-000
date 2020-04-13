class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES(?, ?)", name, type)
    end

    def self.find(id,db)
       pokemon_stats = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
       Pokemon.new(id: pokemon_stats[0], name: pokemon_stats[1], type: pokemon_stats[2], db: db)
    end

end
