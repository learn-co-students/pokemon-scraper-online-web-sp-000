class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(name:, type:, db:, id:nil)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save
        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL

        DB[:conn].execute(sql, self.name, self.type, self.db)
        @id = DB[:conn].execute("SELECT last insertrow() FROM pokemon")[0][0]
    end
end
