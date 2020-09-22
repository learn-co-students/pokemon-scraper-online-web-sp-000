class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type 
        @db = db 
    end 

    def self.save(name, type, db)
        # purpose is to save an instance, but is a class method
        # uses arguments to create an instance of self (i.e., Pokemon class)
        # then, take attributes of that instance and insert them into database
        # multiple instances of pokemon with name, type, db, and id attributes
        # multiple rows representing ruby objects (instances of Pokemon) and their attributes
    
        pokemon = self.new(name: name, type: type, db: db)

        if pokemon.id
            pokemon.update
          else
            sql = <<-SQL
              INSERT INTO pokemon (name, type)
              VALUES (?, ?)
            SQL
       
            pokemon.db.execute(sql, pokemon.name, pokemon.type)
            @id = pokemon.db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
          end
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        result = db.execute(sql, id)[0]
        self.new(id: result[0], name: result[1], type: result[2], db: db)
    end

end
