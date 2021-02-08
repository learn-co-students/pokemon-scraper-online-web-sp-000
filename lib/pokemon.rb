class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id_number, db)
        pokemon_information = db.execute("SELECT * FROM pokemon WHERE id=?", id_number).flatten
        Pokemon.new(id: pokemon_information[0], name: pokemon_information[1], type: pokemon_information[2], db: pokemon_information[3])
    end



end
