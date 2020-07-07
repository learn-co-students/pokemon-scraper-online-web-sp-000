require 'pry'
class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(hash)
        @name = hash[:name]
        @type = hash[:type]
        @id = hash[:id]
        @db = hash[:db]
    end 

    def self.create_table
        touch db/pokemon.db
    end

   def self.save(name, type, db)
        if self.find_by_name(name, db)
           self.update
        else
            sql = <<-SQL
            INSERT INTO pokemon(name, type)
            VALUES (?, ?)
            SQL

            db.execute(sql, name, type)
            @id = db.execute("SELECT last_insert_rowid() FROM pokemon")
        end
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT *
            FROM pokemon
            WHERE id = ?
        SQL
        
        db.execute(sql, id).map do |row|
            
        Pokemon.new_from_db(row)
        end.first
    end

    def self.new_from_db(row)
        hash = {}
        hash[:id] = row[0]
        hash[:name] = row[1]
        hash[:type] = row[2]
        new_pokemon = Pokemon.new(hash)
        new_pokemon
    end

    def self.find_by_name(name, db)
        sql = <<-SQL
            SELECT *
            FROM pokemon
            WHERE name = ?
        SQL

        db.execute(sql, name).map do |row|
            Pokemon.new_from_db(row)
        end.first

    end

end
