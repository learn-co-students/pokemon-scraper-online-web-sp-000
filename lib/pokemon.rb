class Pokemon
  attr_accessor :name, :type, :db, :hp, :id

  def initialize (:name, :type, :db, :hp = nil, :id = nil)
    @name = name
    @type = type
    @db = db
    @hp = hp
    @id = id
  end
end
