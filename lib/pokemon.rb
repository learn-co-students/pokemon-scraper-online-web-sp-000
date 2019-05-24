class Pokemon
  attr_accessor :name,:id,:type,:db,:hp

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
   pokemon=Pokemon.new(id:row[0],name:row[1],type:row[2],db:db)
   if row[3]
   pokemon.hp=row[3]
 end
   pokemon
 end

 def alter_hp(hp,db)
   db.execute("UPDATE pokemon SET hp=? WHERE id=?",hp,self.id)
end



end
