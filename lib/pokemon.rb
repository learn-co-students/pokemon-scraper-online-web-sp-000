require 'pry'

class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        new_pokemon = self.new(id:nil, name:name, type:type, db:db)
      
        sql = <<-SQL 
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL
        db.execute(sql, new_pokemon.name, new_pokemon.type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end
    
    def self.find(id, db)
        sql = <<-SQL 
            SELECT * FROM pokemon
            WHERE id = ?
        SQL

        db.execute(sql, id).map do |row|
            new_pokemon = self.new(id:row[0], name:row[1], type:row[2], db:db)
            new_pokemon
        end.first
    end


end
