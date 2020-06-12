class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(name:, type:, db:, id:)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save
        sql = <<-SQL
        INSERT INTO pokemon (name, type, db)
        VALUES (?, ?, ?)
        SQL

        @db.execute(sql, self.name, self.type, self.db)
        # @id = DB[:conn].execute("SELECT last insertrow() FROM pokemon")[0][0]
    end
end
