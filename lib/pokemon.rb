 # this class is responsible for  
    #saving
    #adding
    #removing 
    #updating (changing)

    #put data into database 



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
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", [name, type])  
    end 

    def self.find(id, db)
        statement = db.prepare("SELECT * FROM pokemon WHERE id = ?")
        result_set = statement.execute(id)
        
        results = result_set.collect do |row|
            pokemon = Pokemon.new(name: row[1], type: row[2], db: db, id: id)
            pokemon
        end 
        results [0]
    end

   
end
