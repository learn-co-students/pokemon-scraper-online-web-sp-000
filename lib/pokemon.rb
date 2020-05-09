class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?,?)
    SQL
    db.execute(sql, name, type)
    #if self.id
    #  self.update
    #else
    #  sql = <<-SQL
    #    INSERT INTO pokemon (name,type)
    #    VALUES (?,?)
    #  SQL
    #  @db.execute(sql, self.name, self.type)
    #  @id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    #end
  end

  def self.find(id_num, db)
    #sql = <<-SQL
    #  SELECT *
    #  FROM pokemon
    #  WHERE id = ?
    #  LIMIT 1
    #SQL
    #db.execute(sql, id_num).flatten
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    self.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: pokemon_info[3])
  end

end
