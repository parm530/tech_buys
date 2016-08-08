require 'open-uri'
require 'nokogiri'
require 'pry'

class TechBuys::Scraper

  def self.scrape_laptop_page
    # Link for laptop:
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

end

