class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    values = db.execute("SELECT name, type FROM pokemon WHERE id = ?", id).first
    x = Pokemon.new(id: id, name: values.first, type: values.last, db: db)
    # binding.pry
  end

end
