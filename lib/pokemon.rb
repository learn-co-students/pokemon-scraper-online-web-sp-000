class Pokemon
    attr_accessor :id, :name, :type, :db
    def initialize(id=nil, name = name, type = type, db = db)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL

        db.execute(sql, [name, type])
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]

    end

    def self.find(id, db)
        sql = <<-SQL
        SELECT * from pokemon WHERE id = ?
        SQL
        db.execute(sql, id).map do |row| #array [[1, "Pikachu", "electric"]]
            new_pokemon = self.new
            new_pokemon.id = row[0]
            new_pokemon.name = row[1]
            new_pokemon.type = row[2]
            new_pokemon
        end.first
    end
end
