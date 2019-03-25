class Pokemon
  
 attr_accessor :id, :name, :type, :db, :hp
  
 def initialize(keys)
   @name = keys[:name]
   @id = keys[:id]
   @type = keys[:type]
   @db = keys[:db]
 end
 
 def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type);
 end
 
 def self.find(id, db)
   pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id);
   p_keys = {:id =>pokemon[0][0], :name =>pokemon[0][1], :type =>pokemon[0][2], :db => db}
   self.new(p_keys)
 end
 
end
