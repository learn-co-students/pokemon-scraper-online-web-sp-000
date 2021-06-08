class Pokemon
  attr_accessor :id, :name, :db, :type

  def initialize(id: id = nil, name: name, type: type, db: db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type) VALUES (? ,?);
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
    SELECT * FROM pokemon
    WHERE id = ?;
    SQL

    db.execute(sql, id).map do |row|
      self.new(id: row[0], name: row[1], type: row[2], db: db)
    end.first
  end
end
