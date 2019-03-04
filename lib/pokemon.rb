class Pokemon

  @@all = []

  attr_reader :id
  attr_accessor :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?);",name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = (?);",id)

    error porque no existe. si no existe crear
  end

end
