require 'open-uri'
require 'nokogiri'
require 'pry'

class TechBuys::Scraper

  def scrape_laptop_page
    # Link for laptop:
    link = "http://www.bestbuy.com/site/searchpage.jsp?cp=1&searchType=search&%20_dyncharset=UTF-8&ks=960&sc=Global&list=y&usc=All%20Categories&type=page&id=pcat17071&iht=n&seeAll=&browsedCategory=pcmcat138500050001&st=categoryid%24pcmcat138500050001&qp=operatingsystem_facet%3DOperating%20System~Windows%2010%5Eoperatingsystem_facet%3DOperating%20System~Windows%207%5Eoperatingsystem_facet%3DOperating%20System~Windows%208%5Eoperatingsystem_facet%3DOperating%20System~Windows%2010%20Pro"
    doc = Nokogiri::HTML(open(link))
    laptop_collection = doc.css("div.list-item-postcard")

    laptop_collection.each do|laptop|
      laptop_hash = {}
      laptop_hash[:name] = laptop_collection.text
      binding.pry
    end
  end

end

