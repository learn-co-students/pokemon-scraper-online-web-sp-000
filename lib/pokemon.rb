class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(name:, type:, db:, id:nil)
        @name = name
        @type = type
        @db = db
    end

    def self.save
        sqlite3 ./db/pokemon.db < ./db/schema_migration.sql
        DB[:conn].execute(sql, self.name, self.type, self.db)
        @id = DB[:conn].execute("SELECT last insert_row() FROM pokemon")[0][0]
    end
end
