class Pokemon
  attr_accessor :name,:id,:type,:db,

  def initialize(id:, name:, type:, db:)
     @id=id
     @name=name
     @type=type
     @db=db
  end


  def self.save(name,type,db)

    row=db.execute("INSERT INTO pokemon (name,type)  VALUES (?,?)", name,type)
  end

  def self.find(id,db)
    row=db.execute("SELECT * FROM pokemon WHERE id=?",id)[0]
    pokemon=Pokemon.new(id:row[0],name:row[1],grade:row[2],db:db)
    if row[3]
    pokemon.hp=row[3]
  end
  end


end
