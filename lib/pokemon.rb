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
            CREATE TABLE IF NOT EXISTS pokemons (
                id INTEGER PRIMARY KEY,
                name TEXT,
                type TEXT
            )
        SQL
        DB[:conn].execute(sql) 
    end

    def self.save(name, type, db)
        # if self.id
        #     self.update
        # else 
            sql = <<-SQL
                INSERT INTO pokemon (name, type)
                VALUES (?, ?)
            SQL
            db.execute(sql, name, type)
        #end
    end
end
