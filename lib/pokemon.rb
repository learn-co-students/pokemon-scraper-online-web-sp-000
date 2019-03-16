class Pokemon
attr_accessor :id, :name, :type, :db
# Pokemon.save(pk_name, pk_type, db)

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save
    # ins = db.prepare('insert into catalog (column_name) values (?)')
    # string.each { |s| ins.execute(s) }
    @db.execute( "INSERT INTO pokemon (name, type) ) VALUES ( ?, ? )", [@name, @type])
  end

end
