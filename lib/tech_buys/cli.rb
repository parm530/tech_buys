require 'pry'
require 'launchy'
require 'colorize'
require 'artii'

class TechBuys::CLI

  def call
    system "clear"
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    string = Artii::Base.new
    puts string.asciify("            Welcome   to TechBuys  !")::colorize(:cyan)
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
      puts "Please enter a valid input:"::colorize(:red)
      prompt
    end
  end

  def saved_laptops
    TechBuys::Laptop.create_techbuy(TechBuys::Scraper.scrape_laptop_page)
  end

  def saved_games
    TechBuys::Game.create_techbuy(TechBuys::Scraper.scrape_game_page)
  end

  def saved_wearables
    TechBuys::Wearable.create_techbuy(TechBuys::Scraper.scrape_wearable_tech_page)
  end

  def list(device)
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    puts "#{device.capitalize} on sale:"::colorize(:light_yellow)
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    if device == "laptops"
      saved_laptops.each.with_index(1) do |laptop, i|
      puts "#{i}. #{laptop.name} - #{laptop.price}"::colorize(:light_green)
      end
    elsif device == "games"
      saved_games.each.with_index(1) do |game, i|
      puts "#{i}. #{game.name} - #{game.price}"::colorize(:light_green)
      end
    elsif device == "wearables"
      saved_wearables.each.with_index(1) do |wear, i|
      puts "#{i}. #{wear.name} - #{wear.price}"::colorize(:light_green)
      end
    end 
  end

  def list_description(device, num)
    if(device == "laptops")
      puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
      puts "Description:"::colorize(:cyan)
      saved_laptops.each.with_index(1) do |laptop, i|
        if(num == (i).to_s)
          puts "\t#{laptop.description}"::colorize(:light_green)
        end
      end
      puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    elsif(device == "games")
      puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
      puts "Description:"::colorize(:cyan)
      saved_games.each.with_index(1) do |game, i|
        if(num == (i).to_s)
          puts "\t#{game.description}"::colorize(:light_green)
        end
      end
      puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    elsif(device == "wearables")
      puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
      puts "Description:"::colorize(:cyan)
      saved_wearables.each.with_index(1) do |wear, i|
        if(num == (i).to_s)
          puts "\t#{wear.description}"::colorize(:light_green)
        end
      end
    puts "---------------------------------------------------------------------------------------------------------------------------------------------"::colorize(:blue)
    end
  end

  def buy(device, num)
    if(device == "laptops")
      saved_laptops.each.with_index(1) do |laptop, i|
        if num == (i).to_s
          Launchy.open "www.bestbuy.com" + "#{laptop.link}"
        end
      end
      menu(device)
    elsif(device == "games")
      saved_games.each.with_index(1) do |game, i|
        if num == (i).to_s
          Launchy.open "www.bestbuy.com" + "#{game.link}"
        end
      end
      menu(device)
    elsif(device == "wearables")
      saved_wearables.each.with_index(1) do |wear, i|
        if num == (i).to_s
          Launchy.open "www.bestbuy.com" + "#{wear.link}"
        end
      end
    end
    menu(device)
  end

  def further_action(device, num)
    if(num.to_i.between?(1,24) == true)
      puts "\n"
      list_description(device, num)
      puts "\nTo purchase this item, type 'buy'. If not, type 'list' to see the choices again or type 'back' to go to previous menu."::colorize(:cyan)
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
        puts "Enter a valid number!"::colorize(:red)
        menu(device)
    end 
  end

  def menu(device)
    puts "\nEnter a number from 1 - 24 to recieve more info, type 'list' to see the choices again or type 'back' to go to previous menu."::colorize(:cyan)
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
