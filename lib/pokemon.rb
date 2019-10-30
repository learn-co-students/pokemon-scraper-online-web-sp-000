class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    poke_find = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    self.new(id: poke_find[0], name: poke_find[1], type: poke_find[2], db: db)
  end

end
