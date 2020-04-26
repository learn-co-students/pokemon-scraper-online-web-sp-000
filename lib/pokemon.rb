class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(name:, type:, db:, id: nil)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ? LIMIT 1"
        row = db.execute(sql, id)[0]
        new_pokemon = self.new(name: row[1], type: row[2], db: db)
        new_pokemon.id = row[0]
        new_pokemon
    end
end
