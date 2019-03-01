class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name,type)
  end
  
  def self.find(id, db)
    attribute = db.execute("SELECT * FROM pokemon")[0]
    Pokemon.new(id: attribute[0], name: attribute[1], type: attribute[2], db: db)
  end
end
