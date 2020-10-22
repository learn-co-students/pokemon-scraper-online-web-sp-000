class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        #Initialize with keyword arguments means the argument: format
        @id = id
        @name = name
        @type = type
        @db = db
    end 

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql, name, type)
        id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        result = db.execute(sql, id)[0]
        pokemon = Pokemon.new(id: id, name: result[1], type: result[2], db: db)
        pokemon 
    end
end
