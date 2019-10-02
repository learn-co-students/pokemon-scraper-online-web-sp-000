class Pokemon

  attr_accessor :name, :type, :db, :id


  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"

    variable = db.execute(sql, id)
    self.new(name: variable[0][1], type: variable[0][2], db: db, id: variable[0][0])

  end

end
