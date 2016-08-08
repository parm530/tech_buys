class TechBuys::Laptop

  def self.all
    puts <<-DOC.gsub /^\s*/, ''
      1. Asus - VivoBook X540SA 15.6 Laptop - Intel Pentium - 4GB Memory - 500GB Hard Drive - Silver gradient IMR with hairline Price:$279.99
      2. HP - 15.6 Touch-Screen Laptop - AMD A10-Series - 6GB Memory - 1TB Hard Drive - Black, Linear texture, Gradient grooves Price:$349.99
    DOC
  end

end