require 'pry'
require 'launchy'
require 'colorize'

class TechBuys::CLI

  def call
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    puts "\t\t\t\t\t\t\tWelcome to Tech Buys!"::colorize(:cyan)
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    prompt
    exit
  end

  def prompt
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    puts "\t\t\t\tPlease enter 'laptops', 'games' or 'wearables' to see deals from BestBuy.com, or 'exit':"::colorize(:cyan)
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    user_input = gets.strip.downcase
    if(user_input == "laptops" || user_input == "games" || user_input == "wearables")
      list(user_input)
      menu(user_input)
    elsif(user_input == "exit")

    else
      puts "Please enter a valid input:"::colorize(:magenta)
      prompt
    end
  end

  def saved_laptops
    @laptops = TechBuys::Laptop.create_laptop(TechBuys::Scraper.scrape_laptop_page)
    @laptops
  end

  def saved_games
    @games = TechBuys::Game.create_game(TechBuys::Scraper.scrape_game_page)
    @games
  end

  def saved_wearables
    @wearables = TechBuys::Wearable.create_wearable(TechBuys::Scraper.scrape_wearable_tech_page)
    @wearables
  end

  def list(device)
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    puts "#{device.capitalize} on sale:"::colorize(:light_yellow)
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    if device == "laptops"
      saved_laptops.each.with_index(1) do |hash, i|
      puts "#{i}. #{hash[:name]} - #{hash[:price]}"::colorize(:light_green)
      end
    elsif device == "games"
      saved_games.each.with_index(1) do |hash, i|
      puts "#{i}. #{hash[:name]} - #{hash[:price]}"::colorize(:light_green)
      end
    elsif device == "wearables"
      saved_wearables.each.with_index(1) do |hash, i|
      puts "#{i}. #{hash[:name]} - #{hash[:price]}"::colorize(:light_green)

      end
    end 
  end

  def list_description(device, num)
    if(device == "laptops")
      puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
      puts "Description:"::colorize(:cyan)
      saved_laptops.each.with_index(1) do |hash, i|
        if(num == (i).to_s)
          puts "\t#{hash[:description]}"::colorize(:light_yellow)
        end
      end
      puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    elsif(device == "games")
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
    if(device == "laptops")
      saved_laptops.each.with_index(1) do |hash, i|
        if num == (i).to_s
          Launchy.open "www.bestbuy.com" + hash[:link]
        end
      end
      # menu(device)
    elsif(device == "games")
      saved_games.each.with_index(1) do |hash, i|
        if num == (i).to_s
          Launchy.open "www.bestbuy.com" + hash[:link]
        end
      end
      menu(device)
    elsif(device == "wearables")
      saved_wearables.each.with_index(1) do |hash, i|
        if num == (i).to_s
          Launchy.open "www.bestbuy.com" + hash[:link]
        end
      end
    end
    menu(device)
  end

  def further_action(device, num)
    if(num.to_i.between?(1,24) == true)
      puts "\n"
      list_description(device, num)
      puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'back' to go to previous menu."::colorize(:light_red)
      mode = gets.strip
        if(mode == "buy")
          buy(device, num)
        elsif(mode == "list")
          puts "\n"
          list(device)
          menu(device)
        elsif(mode == "back")
          puts"\n"
          prompt
        end
      else
        puts "Enter a valid number!"::colorize(:magenta)
        menu(device)
    end 
  end

  def menu(device)
    puts "\nEnter a number from 1 - 24 to recieve more info, type 'list' to see the choices again or type 'back' to go to previous menu."::colorize(:light_red)
    input = gets.strip
    if(input == "back")
      prompt
    elsif(input == "list")
      if device == "laptops"
        list(device)
      elsif device == "games"
        list(device)
      elsif device == "wearables"
        list(device)
      end
    else
      further_action(device, input)
    end
  end

  def exit
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    puts "\t\t\t\t\t\t\tThank you, goodbye :)!"::colorize(:cyan)
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
  end

end
