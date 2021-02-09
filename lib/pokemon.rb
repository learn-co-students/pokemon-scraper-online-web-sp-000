class Pokemon
    attr_reader :id
    attr_accessor :name, :type, :db

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.create(name, type, db) 
        self.new(name, type, db)
        self.save(name, type, db)
    end

    def self.create_from_db(row, db)
        self.new(id: row[0], name: row[1], type: row[2], db: db)
    end

    def self.save(name, type, db)

        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"

        db.execute(sql, name, type)
        db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.update(id, name, type, db)
        sql = "UPDATE pokemon SET name = ?, type = ? WHERE id = ?"
        db.execute(sql, name, type, id)
      end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        poke = db.execute(sql, id).first
        self.create_from_db(poke, db)
    end
end
