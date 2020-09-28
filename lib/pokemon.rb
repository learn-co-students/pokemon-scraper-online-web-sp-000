class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(name:, type:, db:, id: nil)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def update
        sql = "UPDATE pokemon SET name = ?, type = ? WHERE id = ?"
        DB[:conn].execute(sql, self.name, self.type, self.id)
    end

    def self.find(inputID, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        selectedRow = db.execute(sql, inputID)
        newPokemon = Pokemon.new(name: selectedRow[0][1], type: selectedRow[0][2], db: db, id: selectedRow[0][0])
    end

end