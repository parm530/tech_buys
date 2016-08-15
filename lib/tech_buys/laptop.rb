require 'pry'
class TechBuys::Laptop

  extend TechBuys::Createable
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

end