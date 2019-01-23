class Pokemon
  attr_accessor :name, :id, :type, :db
 @@all = []
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type)
    VALUES (?, ?)",name, type)
  end

 def self.find(id, db)
   attr = db.execute("SELECT name, type FROM pokemon WHERE id = ?", id)
   name = attr[0][0]
   type = attr[0][1]
   pokemon = Pokemon.new(id:id, name:name, type: type, db:db)
   pokemon
 end

 def alter_hp(new_hp, db)
   db.execute("UPDATE pokemon SET hp=? WHERE id = ?", new_hp, self.id)
 end

 def hp
   self.db.execute("SELECT hp FROM pokemon WHERE id = ?", self.id).flatten.first
 end

end
