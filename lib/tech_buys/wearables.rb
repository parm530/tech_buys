require 'pry'
class TechBuys::Wearable

  extend TechBuys::Createable
  attr_accessor :name, :price, :description, :link

  @@all = []

  def initialize(wearable_hash)
    wearable_hash.each do |key, value|
      self.send("#{key}=", value) 
    end
    @@all << self
  end

  def self.all
      @@all
  end

end