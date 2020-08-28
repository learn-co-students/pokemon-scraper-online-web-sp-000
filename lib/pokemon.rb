class Pokemon
    attr_accessor :name, :type, :id, :db

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name,type,db)
        sql = "INSERT INTO pokemon(name, type) VALUES(?,?)"
        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * 
            FROM pokemon
            WHERE id = ?
        SQL
        row = db.execute(sql, id)[0]
        Pokemon.new(id: row[0], name: row[1], type: row[2], db: @db)
    end
end
