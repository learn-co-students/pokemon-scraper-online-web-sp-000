class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id="", name="", type="", db="")
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    #@db[:conn].execute(sql)("INSERT INTO pokemon(name, type) VALUES (?,?)"[name,type])
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    info = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?",id).flatten
    pokemon = self.new(id = info[0], name = info[1], type = info[2], db: db)
    pokemon
  end

end
