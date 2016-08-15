require 'pry'
class TechBuys::Game

  extend TechBuys::Createable
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

end