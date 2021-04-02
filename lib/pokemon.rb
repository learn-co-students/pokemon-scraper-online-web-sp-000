class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon(name, type)
            VALUES (?, ?)
        SQL

        db.execute(sql, name, type)            
    end

    def self.find(id, db)
        attrs = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten

        Pokemon.new(id: attrs[0], name: attrs[1], type: attrs[2], db: db)
        

    end

end
