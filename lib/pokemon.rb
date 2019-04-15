class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize (id, name, type, db)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
  end

  def self.save(name, type, db)
  end

  def self.find(id, db)
    #db.execute("SELECT * FROM pokemon WHERE id == #{id};")
  end
end
