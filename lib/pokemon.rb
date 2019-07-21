require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  def self.find(id, db)
        sql = <<-SQL
         SELECT *
         FROM pokemon
         where id = ?
        SQL
        binding.pry
        arr = db.execute(sql, id).first
        poke = Pokemon.new(id: arr[0], name: arr[1], type: arr[2], db: db)
        poke
        # db.execute(sql, id).map do |row|
          # self.new_from_db(row)
        # end.first
      end

  def self.save(name, type, db)
      # if self.find != nil
      #   self.update
      # else
        sql = <<-SQL
          INSERT INTO pokemon (name, type)
          VALUES (?, ?)
        SQL
        # binding.pry
        db.execute(sql, name, type)
        # @id =db.execute("SELECT last_insert_rowid() FROM students")[0][0]
      # end
    end


end
