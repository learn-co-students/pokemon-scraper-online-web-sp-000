class Pokemon
    attr_accessor :id,:name,:type,:db
    def initialize(id:nil,name:"",type:"",db:"")
    # is initialized with keyword arguments of id, name, type and db
        @id=id
        @name=name
        @type=type
        @db=db
    end

    def self.save(name,type,db)
        # if self.id
        #   self.update
        # else
            sql = <<-SQL
            INSERT INTO pokemon (name, type) 
            VALUES (?, ?)
          SQL
          db.execute(sql, name, type)
        # end
        pnew=self.new(name:name,type:type,db:db)
        pnew.id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
        self
    end

    def self.find(id,db)
        #finds a pokemon from the database by their id number and returns a new Pokemon object
        sql = <<-SQL
        SELECT *
        FROM pokemon
        WHERE id=?
        LIMIT 1
        SQL
        db.execute(sql,id).map do |row|
          self.new_from_db(row)
        end.first
    end

    def self.new_from_db(row)
        # binding.pry
        new_rec = self.new  # self.new is the same as running Student.new
        new_rec.id = row[0]
        new_rec.name =  row[1]
        new_rec.type = row[2]
        new_rec  # return the newly created instance
      end

  end
