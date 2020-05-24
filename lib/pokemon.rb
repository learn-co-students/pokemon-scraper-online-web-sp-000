# require_relative "../config/environment.rb"

class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id    
        @name = name
        @type = type
        @db = db
    end 

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT *
            FROM pokemon 
            WHERE id = ? 
        SQL

        found_pokemon = DB[:conn].execute(sql, id)
        Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: db)
    end

end
