class Pokemon
  attr_accessor :name, :type, :id, :db

  def initialize(id:,name:,type:, db:)
    self.name = name
    self.type = type
    self.id = id
    self.db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?,?);
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
    SELECT * FROM pokemon
    WHERE id = ?;
    SQL

    row = db.execute(sql,id).first
    self.new(id:row[0], name:row[1], type:row[2], db:db)
  end


end
