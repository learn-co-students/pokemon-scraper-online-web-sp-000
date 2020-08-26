class Pokemon

     attr_accessor :name, :id, :type, :db

     def initialize(name, id, type, db)
          @name = name
          @id = id
          @type = type
          @db = db
     end

     def self.save

     end

end
