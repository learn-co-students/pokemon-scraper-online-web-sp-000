class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon(name, type) VALUES (?,?)"
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        pokemon = db.execute(sql, id)
        self.new(
            id: pokemon[0][0], 
            name: pokemon[0][1], 
            type: pokemon[0][2], 
            db: db )
    end
    

end
