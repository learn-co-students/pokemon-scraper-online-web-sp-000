
class Pokemon
    attr_accessor :id, :name, :type, :db 

    def initialize(id:, name:, type:, db:)
        @id = id 
        @name = name 
        @type = type 
        @db = db 
    end 

    def self.save(name, type, db) 
        # saves an instance of a pokemon with the correct id 
        #binding.pry 
        db.execute("INSERT INTO pokemon (name, type) 
                    VALUES (?, ?)", [name, type])
    end 

    def self.find(id, db)
        # finds a pokemon from the database by their id number and returns a new Pokemon object 
        #binding.pry  
        db.execute("SELECT * FROM pokemon WHERE id = ?", [id])
    end 


end
