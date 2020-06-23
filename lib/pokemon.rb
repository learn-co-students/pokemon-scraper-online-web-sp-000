class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id
  def initialize(id:,name:,type:,db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end
  def self.save(name,type,db)
    sql = <<-SQL
      INSERT INTO pokemon(name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name,type)
  end
  def  self.find(id,db)
    sql = <<-SQL
    SELECT * FROM pokemon
    WHERE id = ?

    SQL
    pokemon = db.execute(sql, id)
   p Pokemon.new(id: pokemon[0][0],name: pokemon[0][1],type: pokemon[0][2],db: pokemon[0][3])

  end
end
