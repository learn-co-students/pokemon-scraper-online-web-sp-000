class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(**params)
    @id = params[:id]
    @name = params[:name]
    @type = params[:type]
    @db = params[:db]
    if params[:hp]
      @hp = params[:hp]
    else
      @hp = 60
    end
  end
  
  def self.save(name, type, db, hp=60)
    begin # easiest way to see if the tests have added hp yet... lol
      db.execute("INSERT INTO pokemon (name, type, hp) VALUES (?, ?, ?)", name, type, hp)
    rescue
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id==?", id)
    test = self.new({:id=>id, :name=>pokemon[0][1], :type=>pokemon[0][2], :db=>db, :hp=>pokemon[0][3]})
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp=(?) WHERE pokemon.id==(?)", hp, @id)
  end
end
