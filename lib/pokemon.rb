class Pokemon
  attr_accessor :id, :name, :type, :db, :hp 
  @@all = []
  
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    a = db.execute("SELECT * FROM pokemon WHERE :id = (id)", id)
    Pokemon.new(id: a[0][0], name: a[0][1], type: a[0][2], db: db, hp: a[0][3])
  end
  
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET 'hp' = ? WHERE :id = (id)", hp, self.id)
  end
  
end
