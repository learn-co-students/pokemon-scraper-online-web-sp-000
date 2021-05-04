class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(pokemon_data)
        @id = pokemon_data[:id]
        @name = pokemon_data[:name]
        @type = pokemon_data[:type]
        @db = pokemon_data[:db]
        # Pokemon.save(self.name, self.type, self.db)
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        row = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)[0]
        self.new({id: row[0], name: row[1], type: row[2], db: row[3]})
    end

end
