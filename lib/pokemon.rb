class Pokemon

  attr_reader :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)

    info = db.execute("select * from pokemon where id=?", id).flatten
    Pokemon.new(id: info[0], name: info[1], type: info[2], db: db)

  end

  # def self.save(name, breed, age, database_connection)
  #   database_connection.execute("INSERT INTO cats (name, breed, age) VALUES (?, ?, ?)",name, breed, age)
  # end



end
