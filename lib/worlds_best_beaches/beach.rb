class WorldsBestBeaches::Beach

  # creates callable methods or attributes or properties for each Beach instance
  attr_accessor :name, :city, :country, :insta_appeal, :fun_fact, :travel_tips #might want to add best time of year to visit in the future

  # can I use .send?

  # returns a collection of instances of Beach objects
  def self.all
    # puts <<-DOC.gsub /^\s+/, ""
    #   1. Whitehaven Beach, Whitsunday Islands, Australia
    #   2. Pink Sands Beach, Harbour Island, Bahamas
    # DOC
    self.scrape_beaches
  end

    # scrapes the best beaches webpage and assigns predefined attributes to Beach objects
  def self.scrape_beaches
    beaches = []

    beaches << self.scrape_forbes

    beaches
  end

  def self.scrape_forbes
    doc = Nokogiri::HTML(open("https://www.forbes.com/sites/laurabegleybloom/2017/11/27/ranked-the-worlds-50-best-beaches"))
    beach = self.new
    # binding.pry
    beach.name = doc.css("p strong")[0].text.split(",")[0].sub!( /\A.{3}/m, "" ) # << gives me the name of the first beach
    beach.city = doc.css("p strong")[4].text.split(",")[1].lstrip # << city of first beach
    beach.country = doc.css("p strong")[0].text.split(",")[2].lstrip # << country of first beach
    beach.insta_appeal = doc.css("p")[7].text
    beach.fun_fact = doc.css("p")[8].text
    beach.travel_tips = doc.css("p")[9].text
    beach
  end
end

#
#
#   @@all = []
#
#   def self.new_from_index_page(r)
#     self.new(
#       r.css("h2").text,
#       "https://www.forbes.com/sites/laurabegleybloom/2017/11/27/ranked-the-worlds-50-best-beaches/#554b527b5c29#{r.css("a").attribute("href").text}",
#       r.css("h3").text,
#       r.css(".position").text
#       )
#   end
#
#   def initialize(name=nil, url=nil, location=nil, position=nil)
#     @name = name
#     @location = location
#     @description = description
#     @fun_fact = fun_fact
#     @travel_tips
#     @@all << self
#   end
#
#   def self.all
#     @@all
#   end
#
#   def self.find(id)
#     self.all[id-1]
#   end
#
#   def best_dish
#     @best_dish ||= doc.css("div.c-4.nr.nt ul:nth-child(8) li").text
#     # @best_dish ||= doc.xpath("//div[@class='c-4 nr nt']/ul[3]/li").text
#   end
#
#   def food_style
#     @food_style ||= doc.css("div.c-4.nr.nt ul:nth-child(6) li").text
#     # @food_style ||= doc.xpath("//div[@class='c-4 nr nt']/ul[2]/li").text
#   end
#
#   def contact
#     @contact ||= doc.css("div.c-4.nr.nt ul:nth-child(10) li:nth-child(1)").text.split("+").join(". Tel: +")
#     # @contact ||= doc.xpath("//div[@class='c-4 nr nt']/ul[4]/li[1]").text.split("+").join(". Tel: +")
#   end
#
#   def head_chef
#     @head_chef ||= doc.css("div.c-4.nr.nt ul:nth-child(3) li").text.split(" (pictured)").join("")
#     # @head_chef ||= doc.xpath("//div[@class='c-4 nr nt']/ul[1]/li").text.split(" (pictured)").join("")
#   end
#
#   def website_url
#     @website_url ||= doc.css("div.c-4.nr.nt ul:nth-child(10) li:nth-child(2) a").text
#     # @website_url ||= doc.xpath("//div[@class='c-4 nr nt']/ul[4]/li[2]/a").text
#   end
#
#   def description
#     @description ||= doc.css("div.c-8.nl.nt > p:nth-child(6)").text
#     # @description ||= doc.xpath("//div[@class='c-8 nl nt']/p[3]").text
#   end
#
#   def doc
#     @doc ||= Nokogiri::HTML(open(self.url))
#   end
# end
