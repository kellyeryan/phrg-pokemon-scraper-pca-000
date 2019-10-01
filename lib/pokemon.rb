require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @db = db
    @name = name
    @type = type
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type)
      VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    all.find do |pokemon_id|
      pokemon_id.id == id
    end
  end

end

