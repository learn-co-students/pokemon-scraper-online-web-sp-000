class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize (id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        
        sql = <<-SQL
        INSERT INTO pokemon (name, type) 
        VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
    end

    def self.find(id, db)
       
        sql = <<-SQL
          SELECT *
          FROM pokemon
          WHERE id = ?
          LIMIT 1
        SQL

        query = db.execute(sql, id).flatten
        Pokemon.new(id: query[0], name: query[1], type: query[2], db: db)
    
    end
end
