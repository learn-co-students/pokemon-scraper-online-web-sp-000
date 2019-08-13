require 'pry'

class Pokemon
    attr_accessor :id, :name, :type, :db

    def self.new_from_db(row)
        pokemon = self.new
        pokemon.id = row[0]
        pokemon.name = row[1]
        pokemon.type = row[2]
        pokemon
    end

    def initialize(id: nil, name: nil, type: nil, db: nil)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute( "INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type] )

        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        sql = <<-SQL
          SELECT *
          FROM pokemon
          WHERE id = ?
          LIMIT 1
        SQL
       
        db.execute(sql, id).map do |row|
          self.new_from_db(row)
        end.first
      end
    

    



end
