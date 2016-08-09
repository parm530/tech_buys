require 'pry'
require 'launchy'
require 'colorize'

class TechBuys::CLI

  def call
    prompt
    exit
  end

  def prompt
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    puts "\t\tWelcome to Tech Buys! Please enter 'laptops', 'games' or 'wearables' to see deals from BestBuy.com:"::colorize(:cyan)
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    user_input = gets.strip.downcase
    if(user_input == "laptops")
      list_laptops
      laptop_menu
    elsif(user_input == "games")
      list_games
      game_menu
    elsif(user_input == "wearables")
      list_wearables
      wearable_menu
    end
  end

  def saved_laptops
    @laptops = TechBuys::Laptop.create_laptop(TechBuys::Scraper.scrape_laptop_page)
    @laptops
  end

  def list_laptops
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    puts "Laptops on sale:"::colorize(:light_yellow)
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    saved_laptops.each.with_index(1) do |hash, i|
      puts "#{i}. #{hash[:name]} - #{hash[:price]}"
    end
  end

  def saved_games
    @games = TechBuys::Game.create_game(TechBuys::Scraper.scrape_game_page)
    @games
  end

  def list_games
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    puts "Games on sale:"::colorize(:light_yellow)
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    saved_games.each.with_index(1) do |hash, i|
      puts "#{i}. #{hash[:name]} - #{hash[:price]}"
    end
  end

  def saved_wearables
    @wearables = TechBuys::Wearable.create_wearable(TechBuys::Scraper.scrape_wearable_tech_page)
    @wearables
  end

  def list_wearables
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    puts "Wearables on sale:"::colorize(:light_yellow)
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    saved_wearables.each.with_index(1) do |hash, i|
      puts "#{i}. #{hash[:name]} - #{hash[:price]}"
    end
  end

  def list_description(device, num)
    if(device == "laptop")
      puts "Description:"::colorize(:cyan)
      saved_laptops.each.with_index(1) do |hash, i|
        if(num == (i).to_s)
          puts "\t#{hash[:description]}"::colorize(:light_yellow)
        end
      end
    elsif(device == "game")
      puts "Description:"::colorize(:cyan)
      saved_games.each.with_index(1) do |hash, i|
        if(num == (i).to_s)
          puts "\t#{hash[:description]}"::colorize(:light_yellow)
        end
      end
    elsif(device == "wearables")
      puts "Description:"::colorize(:cyan)
      saved_wearables.each.with_index(1) do |hash, i|
        if(num == (i).to_s)
          puts "\t#{hash[:description]}"::colorize(:light_yellow)
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
    elsif(device == "wearables")
      saved_wearables.each.with_index(1) do |hash, i|
        if num == (i).to_s
          Launchy.open "www.bestbuy.com" + hash[:link]
        end
      end
    end
        
  end

  def further_action_laptop(device, num)
    if(num.to_i.between?(1,24) == true)
      puts "\n"
      list_description(device, num)
      puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."::colorize(:light_red)
      mode = gets.strip
      if(mode == 'buy')
        buy(device, num)
      elsif(mode == 'list')
        puts "\n"
        list_laptops
      elsif(mode == "exit")
        puts"\n"
        prompt
      end
    end  
  end

  def further_action_game(device, num)
    if(num.to_i.between?(1,24) == true)
      puts "\n"
      list_description(device, num)
      puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."::colorize(:light_red)
      mode = gets.strip
      if(mode == 'buy')
        buy(device, num)
      elsif(mode == 'list')
        puts "\n"
        list_games
      elsif(mode == "exit")
        puts"\n"
        prompt
      end
    end  
  end

  def further_action_wear(device, num)
    if(num.to_i.between?(1,24) == true)
      puts "\n"
      list_description(device, num)
      puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'exit'."::colorize(:light_red)
      mode = gets.strip
      if(mode == 'buy')
        buy(device, num)
      elsif(mode == 'list')
        puts "\n"
        list_wearables
      elsif(mode == "exit")
        puts"\n"
        prompt
      end
    end  
  end

  def laptop_menu
    input = nil
    while input != "exit"
      puts "\nEnter the number of the laptop you'd like more info about, type 'list' to see the choices again, 'back to go to the previous menu or type 'exit'."::colorize(:light_red)
      input = gets.strip
      if(input == "back")
        prompt
      else
        further_action_laptop("laptop", input)
      end
    end
  end

  def game_menu
    input = nil
    while input != "exit"
        puts "\nEnter the number of the game you'd like more info about, type 'list' to see the choices again, 'back' to go to the previous menu or type 'exit'."::colorize(:light_red)
        input = gets.strip
      if(input == "back")
        prompt
      else
        further_action_game("game", input)
      end
    end
  end

  def wearable_menu
    input = nil
    while input != "exit"
        puts "\nEnter the number of the game you'd like more info about, type 'list' to see the choices again, 'back' to go to the previous menu or type 'exit'."::colorize(:light_red)
        input = gets.strip
      if(input == "back")
        prompt
      else
        further_action_wear("wearables", input)
      end
    end
  end

  def exit
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    puts "\t\t\t\t\t\t\tThank you, goodbye :)!"::colorize(:cyan)
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
  end

end
