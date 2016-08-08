require 'pry'
class TechBuys::CLI

  def call
    list_laptops
    menu
    exit
  end

  def saved_laptops
    @laptops = TechBuys::Laptop.create_laptop(TechBuys::Scraper.scrape_laptop_page)
    @laptops
  end

  def list_laptops
    puts "Laptops on sale:"
    saved_laptops.each.with_index(1) do |hash, i|
      puts "#{i}. #{hash[:name]} - #{hash[:price]}"
    end
  end

  def list_description(num)
    puts "Description:"
     saved_laptops.each.with_index(1) do |hash, i|
        # binding.pry
      if num == (i).to_s
      puts "\t#{hash[:description]}"
      end
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "\nEnter the number of the laptops you'd like more info about, type 'list' to see the choices again or type 'exit'."
      input = gets.strip
      case input
      when 'list'
        list_laptops
      when '1'
        puts "\n"
        list_description(input)
      when '2'
        puts "\n"
        list_description(input)
      when '3'
        puts "\n"
        list_description(input)
      when '4'
        puts "\n"
        list_description(input)
      when '5'
        puts "\n"
        list_description(input)
      else
        puts "Please choose a valid option"
      end
    end
  end

  def exit
    puts "Goodbye :)!"
  end

end
