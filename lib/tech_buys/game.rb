require 'pry'
class TechBuys::Game

  attr_accessor :name, :price, :description, :link

  @@all = []

  def initialize(game_hash)
    game_hash.each do |key, value|
      self.send("#{key}=", value) 
    end
    @@all << self
  end

  def self.all
      @@all
  end

  def self.create_game(game_hash)
    game_hash.each do |hash|
      TechBuys::Game.new(hash)
    end
  end

end