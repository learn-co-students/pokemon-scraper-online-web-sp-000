class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name 
        @type = type
        @db = db
    end

    def self.save(name, type, db)
          sql = <<-SQL
            INSERT INTO pokemon (id, name, type, db)
            VALUES (?, ?)
          SQL
          DB[:conn].execute(sql, self.name, self.type, self.db)
          @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
      end

end
