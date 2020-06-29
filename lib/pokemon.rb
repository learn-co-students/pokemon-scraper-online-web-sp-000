class Pokemon
    attr_accessor :name, :type, :db, :id
    def initialize (id:, name:, type:, db:)
        self.id = id
        self.name = name
        self.type = type
        self.db = db
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
        SELECT * FROM pokemon
        WHERE id = ?
        LIMIT 1
        SQL

        row = db.execute(sql, id)[0]
        self.new(id:row[0], name:row[1], type:row[2], db:db)
    
    end
end
