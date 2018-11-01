class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = nil
  end
  
  def alter_hp(hp, db)
    sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
    db.execute(sql, hp, self.id)
    # binding.pry
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    values = db.execute("SELECT name, type FROM pokemon WHERE id = ?", id).flatten
    x = Pokemon.new(id: id, name: values[0], type: values[1], db: db) 
    x.hp = values[2]
    # binding.pry
    x
  end

end
