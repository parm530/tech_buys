require 'open-uri'
require 'nokogiri'
require 'pry'

class TechBuys::Scraper

  def self.scrape_laptop_page
    link = "http://www.bestbuy.com/site/searchpage.jsp?cp=1&searchType=search&st=laptops&_dyncharset=UTF-8&id=pcat17071&type=page&sc=Global&nrp=&sp=-bestsellingsort%20skuidsaas&qp=category_facet%3DAll%20Laptops~pcmcat138500050001&list=n&iht=y&usc=All%20Categories&ks=960&keys=keys"
    doc = Nokogiri::HTML(open(link))
    laptop_collection = doc.css(".list-item")
    
      laptop_collection.collect.with_index do|laptop, i|
      laptop_hash = {}
      laptop_hash[:name] = laptop_collection.css(".list-item-postcard h4")[i].text
      laptop_hash[:price] = laptop_collection.css(".medium-item-price")[i].text
      laptop_hash[:description] = laptop_collection.css("div.short-description")[i].text
      laptop_hash[:link] =  laptop_collection.css(".list-item-postcard h4 a")[i].attribute("href").value
      laptop_hash
    end      
  end

  def self.scrape_game_page
    link = "http://www.bestbuy.com/site/searchpage.jsp?nrp=15&cp=1&seeAll=&browsedCategory=abcat0700000&qp=&ks=960&sp=-bestsellingsort%20skuidsaas&sc=Global&list=y&usc=All%20Categories&type=page&id=pcat17071&iht=n&st=categoryid%24abcat0700000&lid=Products:%20All%20New%20Releases"
    doc = Nokogiri::HTML(open(link))
    game_collection = doc.css(".list-item")
    
      game_collection.collect.with_index do|laptop, i|
      game_hash = {}
      game_hash[:name] = game_collection.css(".list-item-postcard h4")[i].text
      game_hash[:price] = game_collection.css(".medium-item-price")[i].text
      game_hash[:description] = game_collection.css("div.short-description")[i].text
      game_hash[:link] =  game_collection.css(".list-item-postcard h4 a")[i].attribute("href").value
      game_hash
    end
  end

  def self.scrape_wearable_tech_page
    link = "http://www.bestbuy.com/site/searchpage.jsp?cp=1&searchType=search&st=wearable&_dyncharset=UTF-8&id=pcat17071&type=page&sc=Global&nrp=&sp=&qp=category_facet%3DWearable%20Technology~pcmcat332000050000&list=n&iht=y&usc=All%20Categories&ks=960&keys=keys"
    info = Nokogiri::HTML(open(link))
    wearable_collection = info.css(".list-item")
    
      wearable_collection.collect.with_index do|wearable, i|
      wearable_hash = {}
      wearable_hash[:name] = wearable_collection.css(".list-item-postcard h4")[i].text
      wearable_hash[:price] = wearable_collection.css(".medium-item-price")[i].text
      wearable_hash[:description] = wearable_collection.css("div.short-description")[i].text
      wearable_hash[:link] =  wearable_collection.css(".list-item-postcard h4 a")[i].attribute("href").value
      wearable_hash
    end
  end

end

