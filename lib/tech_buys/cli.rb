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
    puts "\t\t\t\t\t\tWelcome to Tech Buys!"::colorize(:cyan)
    puts "\t\t\t\tPlease enter 'laptops', 'games' or 'wearables' to see deals from BestBuy.com, or 'exit':"::colorize(:cyan)
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
      puts "#{i}. #{hash[:name]} - #{hash[:price]}"::colorize(:light_green)
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
      puts "#{i}. #{hash[:name]} - #{hash[:price]}"::colorize(:light_green)
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
      puts "#{i}. #{hash[:name]} - #{hash[:price]}"::colorize(:light_green)
    end
  end

  def list_description(device, num)
    if(device == "laptop")
      puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
      puts "Description:"::colorize(:cyan)
      saved_laptops.each.with_index(1) do |hash, i|
        if(num == (i).to_s)
          puts "\t#{hash[:description]}"::colorize(:light_yellow)
        end
      end
      puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    elsif(device == "game")
      puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
      puts "Description:"::colorize(:cyan)
      saved_games.each.with_index(1) do |hash, i|
        if(num == (i).to_s)
          puts "\t#{hash[:description]}"::colorize(:light_yellow)
        end
      end
      puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    elsif(device == "wearables")
      puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
      puts "Description:"::colorize(:cyan)
      saved_wearables.each.with_index(1) do |hash, i|
        if(num == (i).to_s)
          puts "\t#{hash[:description]}"::colorize(:light_yellow)
        end
      end
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
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
      puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'back'."::colorize(:light_red)
      mode = gets.strip
      if(mode == "buy")
        buy(device, num)
      elsif(mode == "list")
        puts "\n"
        list_laptops
      elsif(mode == "back")
        puts"\n"
        prompt
      end
    end  
  end

  def further_action_game(device, num)
    if(num.to_i.between?(1,24) == true)
      puts "\n"
      list_description(device, num)
      puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'back'."::colorize(:light_red)
      mode = gets.strip
      if(mode == "buy")
        buy(device, num)
      elsif(mode == "list")
        puts "\n"
        list_games
      elsif(mode == "back")
        puts"\n"
        prompt
      end
    end  
  end

  def further_action_wear(device, num)
    if(num.to_i.between?(1,24) == true)
      puts "\n"
      list_description(device, num)
      puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'back' to go to previous menu."::colorize(:light_red)
      mode = gets.strip
      if(mode == "buy")
        buy(device, num)
      elsif(mode == "list")
        puts "\n"
        list_wearables
      elsif(mode == "back")
        puts"\n"
        prompt
      end
    end  
  end

  def laptop_menu
      puts "\nType the number of the laptop to recieve more info, type 'list' to see the choices again or type 'back' to go to previous menu."::colorize(:light_red)
      input = gets.strip
      if(input == "back")
        prompt
      elsif(input == "list")
        list_laptops
      else
        further_action_laptop("laptop", input)
      end

  end

  def game_menu
    puts "\nType the number of the game to recieve more info, type 'list' to see the choices again or type 'back' to go to previous menu."::colorize(:light_red)
      input = gets.strip
    if(input == "back")
      prompt
    elsif(input == "list")
      list_games
    else
      further_action_game("game", input)
    end
  end

  def wearable_menu
    puts "\nType the number of the wearable device to recieve more info, type 'list' to see the choices again or type 'back' to go to previous menu."::colorize(:light_red)
      input = gets.strip
    if(input == "back")
      prompt
    elsif(input == "list")
      list_wearables
    else
      further_action_wear("wearables", input)
    end
  end

  def exit
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    puts "\t\t\t\t\t\t\tThank you, goodbye :)!"::colorize(:cyan)
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
  end

end
