class Pokemon

attr_accessor :name, :type, :db
attr_reader :id

def initialize(name)
  @id = nil
  @type = nil
  @db = nil
  @name = name
end

def self.save(name, type, db)
end

def self.find(id)
end




end
