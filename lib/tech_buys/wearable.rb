require 'pry'
class TechBuys::Wearable

	attr_accessor :title, :price, :description, :link

	@@all = []

	def initialize(wearable_hash)
		wearable_hash.each do |key, value|
			self.send("#{key}=", value)	
		end
		@@all << self
		binding.pry
	end

  def self.all
  		@@all
  end

  def self.create_wearable(wearable_hash)
  	wearable_hash.each do |hash|
  		TechBuys::Wearable.new(hash)
  		binding.pry
  	end
  end

end