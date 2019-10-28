class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    data = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    # binding.pry
    Pokemon.new(id: data[0], name: data[1], type: data[2], db: db)
  end

end
