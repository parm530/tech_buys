require 'pry'
class TechBuys::Laptop

	attr_accessor :name, :price, :description, :link

	@@all = []

	def initialize(laptop_hash)
		laptop_hash.each do |key, value|
			self.send("#{key}=", value)	
		end
		@@all << self
	end

  def self.all
  		@@all
  end

  def self.create_laptop(laptop_hash)
  	laptop_hash.each do |hash|
  		TechBuys::Laptop.new(hash)
  	end
  end

end