class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db 
    end

    def self.create_table
        sql = <<-SQL
            CREATE TABLE IF NOT EXISTS pokemon (
                id INTEGER PRIMARY KEY,
                name TEXT,
                type TEXT
            )
        SQL
        DB.execute(sql) 
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        row = db.execute(sql, id)
        Pokemon.new(id: row[0][0], name: row[0][1], type: row[0][2], db: db)
    end
end
