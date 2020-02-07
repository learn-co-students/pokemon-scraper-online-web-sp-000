class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(name:, type:, db:, id: nil)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    db.execute(sql, id).map do |poke|
      id = poke[0]
      name = poke[1]
      type = poke[2]
      Pokemon.new(name: name, type: type, db: db, id: id)
    end.first
  end

end
