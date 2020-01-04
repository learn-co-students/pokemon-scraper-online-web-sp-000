require "pry"
class Pokemon

  attr_accessor :name, :type, :id, :db

  def initialize(id:nil, name:, type:, db:nil)
    @name=name
    @type=type
    @id=id
  end
  
  def self.save(name,type,db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
  end
  
  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id == ?"
     row = db.execute(sql, id).first
     Pokemon.new(id:row[0], name:row[1], type:row[2])
  end

  #def 

end
