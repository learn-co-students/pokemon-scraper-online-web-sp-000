# require_relative "../config/environment.rb"

class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id    
        @name = name
        @type = type
        @db = db
    end 

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    end

    def self.find(id, db)
        found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: db)
    end

    # def self.new_from_db(row)
    #     new_student = self.new(row[1], row[2], row[0])
    # end 

    # def self.all
    #     sql = <<-SQL
    #         SELECT *
    #         FROM students
    #     SQL
        
    #     DB[:conn].execute(sql).map do |row|
    #         self.new_from_db(row)
    #     end 
    # end

    # def self.find_by_name(name)
    #     sql = <<-SQL
    #         SELECT *
    #         FROM students
    #         WHERE name = ?
    #         LIMIT 1
    #     SQL
        
    #     DB[:conn].execute(sql, name).map do |row|
    #         self.new_from_db(row)
    #     end.first
    # end

    # def self.create(name, grade)
    #     student = Student.new(name, grade)
    #     student.save
    #     student
    # end

    # def update
    #     sql = <<-SQL 
    #         UPDATE students 
    #         SET name = ?, grade = ? 
    #         WHERE id = ?
    #         SQL
    #     DB[:conn].execute(sql, self.name, self.grade, self.id)
    # end 
    
    # def self.create_table
    #     sql = <<-SQL
    #     CREATE TABLE IF NOT EXISTS students (
    #         id INTEGER PRIMARY KEY,
    #         name TEXT,
    #         grade TEXT
    #     )
    #     SQL

    #     DB[:conn].execute(sql)
    # end

    # def self.drop_table
    #     sql = "DROP TABLE IF EXISTS students"
    #     DB[:conn].execute(sql)
    # end

end
