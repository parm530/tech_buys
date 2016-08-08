class TechBuys::CLI

  def call
    list_laptops
    menu
    exit
  end

  def list_laptops
    puts "Laptops on sale:"
    @laptops = TechBuys::Laptop.all
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the laptop you'd like more info about, type 'list' to see the choices again or type 'exit'."
      input = gets.strip
      case input
      when 'list'
        list_laptops
      when '1'
        puts "More info on 1.."
      when '2'
        puts "More info on 2.."
      else
        puts "Please choose a valid option"
      end
    end
  end

  def exit
    puts "Goodbye :)!"
  end

end
