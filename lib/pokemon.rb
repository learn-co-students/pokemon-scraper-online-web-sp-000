require 'pry'
require_relative "../bin/environment.rb"

class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize (name:, type:, db:, id: nil)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)

      sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL

      db.execute(sql, name, type)
      @id = db.execute("SELECT last_insert_rowid() pokemon")[0][0]

    end

    def self.find(id, db)
      sql = "SELECT * FROM pokemon WHERE id = ?"
      result = db.execute(sql, id)[0]
      Pokemon.new(id: result[0], name: result[1], db: db, type: result[2])
    end

end
