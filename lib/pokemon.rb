require_relative "../config/environment.rb"

class Pokemon
  #responsible for removing, adding, saving, or changing about each pokemon
  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, type, id=nil)
    @id = id
    @name = name
    @type = type
  end

  def self.create_table
    #below is a HEREDOC
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT
      )
      SQL

      DB[:conn].execute(sql)  #execute SQL statement on database table
  end

  def self.drop_table
      sql= <<-SQL
      DROP TABLE students
      SQL
      DB[:conn].execute(sql) #execute SQL statement on database table
  end

  def save
  #this method really persists the student instance copy to the database
      if self.id
          self.update  #if there already exists an object instance (row in db) then just update it
      else
          sql = <<-SQL
            INSERT INTO students (name, grade)
            VALUES (?, ?)
          SQL

          DB[:conn].execute(sql, self.name, self.type)
          @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
      end
  end

  def self.create(name, type)
      student = Student.new(name, type)
      student.save
      student
  end

  def self.new_from_db(row)
      # create a new Student object given a row from the database
      #new_student = self.new  # self.new is the same as running Song.new
      id = row[0]
      name = row[1]
      grade = row[2]
      self.new(name,type,id)
      #new_student  # return the newly created instance
  end

  def self.find_by_name(name)
      # find the student in the database given a name
      # return a new instance of the Student class
        sql = <<-SQL
          SELECT *
          FROM students
          WHERE name = ?
          LIMIT 1
        SQL

        DB[:conn].execute(sql, name).map do |row|
          self.new_from_db(row)  #create new ruby objects (instances) and then return the first
        end.first
    end

    def update
        sql = "UPDATE students SET name = ?, grade = ? WHERE id = ?"
        DB[:conn].execute(sql, self.name, self.type, self.id)
    end

end
