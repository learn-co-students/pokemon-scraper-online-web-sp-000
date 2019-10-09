class Pokemon

  attr_accessor :name, :type
  attr_reader :id, :db 
  
  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
  end
  
end