class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name 
        @type = type
        @db = db
    end

    def self.save(name, type, db)
       sql = "INSERT INTO pokemon (name, type) VALUES (?, ?);"
       db.execute(sql, [name, type])
    end

    def self.find(id, db)
        info = db.execute("SELECT * FROM pokemon WHERE id = ?",id).flatten
        Pokemon.new(id: info[0], name: info[1],type: info[2], db: db)
    end
end
