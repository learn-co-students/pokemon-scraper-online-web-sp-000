class Pokemon
  attr_accessor :name, :type, :db, :id
  def initialize(attributes)
    attributes.each{|k,v| self.send(("#{k}="),v)}

  end

  def self.save(name, type, db)
   sql = <<-SQL
   INSERT INTO pokemon(name, type) VALUES(?, ?)
   SQL
   db.execute(sql, name, type)
  end

  def self.find(id,db)
    sql = <<-SQL
    SELECT * FROM pokemon
    WHERE id = ?
    SQL
    row = db.execute(sql, id)[0]
    hash = {:id => row[0], :name => row[1], :type => row[2], :db => db}
    # print row
    # print hash
    obj = self.new(hash)
  end
end
