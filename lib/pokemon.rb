class Pokemon 
  attr_accessor :name, :type, :db, :id 
  
  def initialize(id: nil, name: name, type: type, db: db)
    @id = id 
    @name = name 
    @type = type 
    @db = db 
  end 
  
  def self.save(name, type, db)
    
  end 
  
end 
