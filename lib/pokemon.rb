class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).first
    name = pokemon[1]
    type = pokemon[2]

    self.new(id: id, name: name, type: type, db: db)
  end
end
