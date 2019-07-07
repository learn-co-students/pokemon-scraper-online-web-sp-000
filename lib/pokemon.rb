class Pokemon

 attr_accessor :id, :name, :type, :db, :hp

   def initialize(name:, type:, id:, db:, hp: nil)
    @name = name
    @type = type
    @id = id
    @hp = hp
    @db = db
  end

   def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
  end

   def self.find(id_number, db)
    row = db.execute("SELECT * FROM pokemon WHERE id=?", id_number).first
    self.new(id: row[0], name: row[1], type: row[2], hp: row[3], db: db )
  end

   def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
