require 'pry'
require 'launchy'

class TechBuys::CLI

  def call
    prompt
    exit
  end

  def prompt
    puts "Welcome to Tech Buys! Please enter 'laptops', 'games' or 'wearable devices' to see deals from BestBuy.com:"
    user_input = gets.strip.downcase
    if(user_input == "laptops")
      list_laptops
      laptop_menu
    elsif(user_input == "games")
      list_games
      game_menu
    elsif(user_input == "wearable devices")
    end
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

  def saved_games
    @games = TechBuys::Game.create_game(TechBuys::Scraper.scrape_game_page)
    @games
  end

  def list_games
    puts "Games on sale:"
    saved_games.each.with_index(1) do |hash, i|
      puts "#{i}. #{hash[:name]} - #{hash[:price]}"
    end
  end

  def list_description(device, num)
    if(device == "laptop")
      puts "Description:"
      saved_laptops.each.with_index(1) do |hash, i|
        if(num == (i).to_s)
          puts "\t#{hash[:description]}"
        end
      end
    elsif(device == "game")
      puts "Description:"
      saved_games.each.with_index(1) do |hash, i|
        if(num == (i).to_s)
          puts "\t#{hash[:description]}"
        end
      end
    end
        
  end

  def buy(device, num)
    if(device == "laptop")
       saved_laptops.each.with_index(1) do |hash, i|
        if num == (i).to_s
          Launchy.open "www.bestbuy.com" + hash[:link]
        end
      end
    elsif(device == "game")
        saved_games.each.with_index(1) do |hash, i|
        if num == (i).to_s
          Launchy.open "www.bestbuy.com" + hash[:link]
        end
      end
    end
        
  end

  def laptop_menu
    input = nil
    while input != "exit"
      puts "\nEnter the number of the laptop you'd like more info about, type 'list' to see the choices again or type 'exit'."
      input = gets.strip
      case input

      when 'list'
        list_laptops

      when '1'
        puts "\n"
        list_description("laptop", input)
        puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."
        mode = gets.strip
        if(mode == 'buy')
          buy("laptop", input)
        elsif(mode == 'list')
          puts "\n"
          list_laptops
        end

      when '2'
        puts "\n"
        list_description("laptop", input)
        puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."
        mode = gets.strip
        if(mode == 'buy')
          buy("laptop", input)
        elsif(mode == 'list')
          puts "\n"
          list_laptops
        end

      when '3'
        puts "\n"
        list_description("laptop", input)
        puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."
        mode = gets.strip
        if(mode == 'buy')
          buy("laptop", input)
        elsif(mode == 'list')
          puts "\n"
          list_laptops
        end

      when '4'
        puts "\n"
        list_description("laptop", input)
        puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."
        mode = gets.strip
        if(mode == 'buy')
          buy("laptop", input)
        elsif(mode == 'list')
          puts "\n"
          list_laptops
        end

      when '5'
        puts "\n"
        list_description("laptop", input)
        puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."
        mode = gets.strip
        if(mode == 'buy')
          buy("laptop", input)
        elsif(mode == 'list')
          puts "\n"
          list_laptops
        end

      when "buy"
        puts"\n"
        buy(num)
      when "back"
        puts"\n"
        prompt
      else
        puts "Please choose a valid option"
      end
    end
  end

  def game_menu
    input = nil
    while input != "exit"
        puts "\nEnter the number of the game you'd like more info about, type 'list' to see the choices again, 'back' to go to previous menu or type 'exit'."
        input = gets.strip
      case input

      when 'list'
        list_games

      when '1'
        puts "\n"
        list_description("game", input)
        puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."
        mode = gets.strip
        if(mode == 'buy')
          buy("game", input)
        elsif(mode == 'list')
          puts "\n"
          list_games
        end

      when '2'
        puts "\n"
        list_description("game", input)
        puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."
        mode = gets.strip
        if(mode == 'buy')
          buy("game", input)
        elsif(mode == 'list')
          puts "\n"
          list_games
        end

      when '3'
        puts "\n"
        list_description("game", input)
        puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."
        mode = gets.strip
        if(mode == 'buy')
          buy("game", input)
        elsif(mode == 'list')
          puts "\n"
          list_games
        end

      when '4'
        puts "\n"
        list_description("game", input)
        puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."
        mode = gets.strip
        if(mode == 'buy')
          buy("game", input)
        elsif(mode == 'list')
          puts "\n"
          list_games
        end

      when '5'
        puts "\n"
        list_description("game", input)
        puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."
        mode = gets.strip
        if(mode == 'buy')
          buy("game", input)
        elsif(mode == 'list')
          puts "\n"
          list_games
        end

      when "buy"
        puts"\n"
        buy(num)
      when "back"
        puts"\n"
        prompt
      else
        puts "Please choose a valid option"
      end
    end
    
  end

  def exit
    puts "Goodbye :)!"
  end

end
