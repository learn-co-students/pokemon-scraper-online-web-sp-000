class Pokemon
    attr_accessor :name, :type
    attr_reader :id, :db
    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end
    def self.save(name, type, db)
        if @id != nil
        
        else
            sql = <<-SQL
                INSERT INTO pokemon (name, type)
                VALUES (?, ?)
            SQL

            db.execute(sql, name, type)

            #@id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
        end
    end
    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?
        SQL
        results = db.execute(sql, id)[0]
        
        hashResult = {
            :id => results[0],
            :name => results[1],
            :type => results[2],
            :db => db
        }
        newPokemon = Pokemon.new(hashResult)
        newPokemon
    end
    def self.new_from_db(row)

    end
end
