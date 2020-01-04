class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(name:, type:, id:, db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end

  def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (? , ?)", name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    row = db.execute(sql, id).flatten
    new_pokemon = Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
  end

end
