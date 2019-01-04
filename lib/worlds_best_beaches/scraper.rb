# class WorldsBestBeaches::Scraper
#
#   def get_page
#     binding.pry
#     Nokogiri::HTML(open("https://www.forbes.com/sites/laurabegleybloom/2017/11/27/ranked-the-worlds-50-best-beaches/#554b527b5c29"))
#   end
#
#   def scrape_beaches_index
#      self.get_page.css("div#t1-50 li")
#   end
#
#   def make_beaches
#     scrape_beaches_index.each do |r|
#       WorldsBestBeaches::Beach.new_from_index_page(r)
#     end
#   end
# end
