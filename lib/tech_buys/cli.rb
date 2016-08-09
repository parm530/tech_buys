require 'pry'
require 'launchy'

class TechBuys::CLI

  def call
    list_laptops
    list_wearables
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

  def list_wearables
    puts "Laptops on sale:"
    saved_wearables.each.with_index(1) do |hash, i|
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

  def buy(num) 
    saved_laptops.each.with_index(1) do |hash, i|
        # binding.pry
      if num == (i).to_s
        # binding.pry
        Launchy.open "www.bestbuy.com" + hash[:link]
      end
    end
  end

#wearable information
  def saved_wearables
    @wearables = TechBuys::Wearable.create_wearable(TechBuys::Scraper.scrape_wearable_tech_page)
    @wearables
    binding.pry
  end

  def list_wearables
    puts "Wearable Technology on sale:"
    saved_wearables.each.with_index(1) do |hash, i|
      puts "#{i}. #{hash[:title]} - #{hash[:price]}"
    end
  end

  def wearables_description(num)
    puts "Description:"
     saved_wearables.each.with_index(1) do |hash, i|
        # binding.pry
      if num == (i).to_s
      puts "\t#{hash[:description]}"
      end
    end
  end

  def buy(num) 
     saved_wearables.each.with_index(1) do |hash, i|
        # binding.pry
      if num == (i).to_s
        # binding.pry
        Launchy.open "www.bestbuy.com" + hash[:link]
      end
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "\nEnter the number of the laptop you'd like more info about, type 'list' to see the choices again or type 'exit'."
      input = gets.strip
      case input

      when 'list'
        list_laptops

      when '1'
        puts "\n"
        list_description(input)
        puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."
        mode = gets.strip
        if(mode == 'buy')
          buy(input)
        elsif(mode == 'list')
          puts "\n"
          list_laptops
        end

      when '2'
        puts "\n"
        list_description(input)
        puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."
        mode = gets.strip
        if(mode == 'buy')
          buy(input)
        elsif(mode == 'list')
          puts "\n"
          list_laptops
        end

      when '3'
        puts "\n"
        list_description(input)
        puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."
        mode = gets.strip
        if(mode == 'buy')
          buy(input)
        elsif(mode == 'list')
          puts "\n"
          list_laptops
        end

      when '4'
        puts "\n"
        list_description(input)
        puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."
        mode = gets.strip
        if(mode == 'buy')
          buy(input)
        elsif(mode == 'list')
          puts "\n"
          list_laptops
        end

      when '5'
        puts "\n"
        list_description(input)
        puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."
        mode = gets.strip
        if(mode == 'buy')
          buy(input)
        elsif(mode == 'list')
          puts "\n"
          list_laptops
        end

      when "buy"
        puts"\n"
        buy(num)
      else
        puts"\n"
        puts "Please choose a valid option"
      end
    end
  end

  def exit
    puts"\n"
    puts "Goodbye :)!"
  end

end
