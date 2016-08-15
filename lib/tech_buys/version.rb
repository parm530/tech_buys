module TechBuys
  VERSION = "0.1.0"
  
  module Createable

    def create_techbuy(array)
      array.collect do |hash|
        self.new(hash)
      end

    end
  end

end
