class Pokemon
    attr_accessor :id, :name, :type, :db
    def initialize(hash)
        #i think the db is passed to you. it should be that SQLite3::Databae.new(../db/pokemon.db) thing
        #earlier we had db[:conn] simply because it's stored in a hash with the key conn. same thing.
        @id = hash[:id]
        @name = hash[:name ]
        @type = hash[:type]
        @db = hash[:db]
    end 

    def self.save(name, type, db) #class method
        #it wants you to save in database only, not create a ruby instance 
        #first add to database
        sql = <<-SQL
        INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
    end

    def self.find(id, db)
        #pikachu_from_db = Pokemon.find(1, @db)
        #it 'finds a pokemon from the database by their id number and returns a new Pokemon object' do
        # The find method creates a new Pokemon after selecting their row from the database by their id number.
      

            sql = <<-SQL
                SELECT * FROM pokemon WHERE id = ?
            SQL
    
            result = db.execute(sql, id).first #get the first item. which is an array. 
            #result looks like [1, "Pikachu", "electric"]

            #now initialize a pokemon instance:
            myhash = {:id => result[0], :name => result[1], :type => result[2], :db => db}
            #binding.pry
            #i could also do this like they do it, but i want to practice and understand the structure
            #its just a hash. it seems hashes don't need a {} if passing into a parameter that expects a hash..
            #newinstance = Pokemon.new(id: result[0], name: result[1], type: result[2], db: db)

            newinstance = Pokemon.new(myhash)
            newinstance
    end 

end
