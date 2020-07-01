require 'pry'
class Pokemon
    
    attr_accessor :id, :name, :type, :db 
    def initialize(id:, name:, type:, db:)
        @id = id 
        @name = name 
        @type = type 
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end 

    def self.find(id_num, db)
        poke_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
        self.new(id: poke_data[0], name: poke_data[1], type: poke_data[2], db: db)
        # binding.pry
    end 
    
end
