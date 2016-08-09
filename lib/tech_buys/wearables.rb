require 'pry'
class TechBuys::Wearable

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

  def self.create_wearable(wearable_hash)
    wearable_hash.each do |hash|
      TechBuys::Wearable.new(hash)
    end
  end

end