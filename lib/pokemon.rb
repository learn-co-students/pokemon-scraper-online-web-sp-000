class Pokemon

  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(id:nil, db:nil, name:, type:)
    @id = id
    @db = db
    @name = name
    @type = type
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  # find pokemon by id
  # return a new pokemon object given the found row
  def self.find(id, db)
    found = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    # result =
    Pokemon.new(id: found[0], name: found[1], type: found[2], db:db)
  end

end
