class Pokemon

    attr_accessor :name, :type, :db, :hp
    attr_reader :id

    def initialize(id:, name:, type:, db:, hp: nil)
        @id = id
        @name = name 
        @type = type 
        @db = db
        @hp = hp
    end

    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
    end 

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        result = db.execute(sql, id)[0]
        Pokemon.new(id:result[0], name:result[1], type:result[2], db:db)
    end 
end
