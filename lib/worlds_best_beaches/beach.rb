class WorldsBestBeaches::Beach

  # creates callable methods or attributes or properties for each Beach instance
  attr_accessor :name, :city, :country, :insta_appeal, :fun_fact, :travel_tips # might want to add best time of year to visit in the future

  # returns a collection of instances of Beach objects
  def self.all
    self.scrape_beaches
  end

  def self.scrape_beaches
    beaches = []
    beaches << self.scrape_forbes
    beaches
  end

  # scrapes the best beaches webpage and assigns predefined attributes to Beach objects
  def self.scrape_forbes
    doc = Nokogiri::HTML(open("https://www.forbes.com/sites/laurabegleybloom/2017/11/27/ranked-the-worlds-50-best-beaches"))
    beach = self.new
    beach.name = doc.css("p strong")[0].text.split(",")[0].sub!( /\A.{3}/m, "" ) # << gives me the name of the first beach
    beach.city = doc.css("p strong")[4].text.split(",")[1].lstrip # << city of first beach
    beach.country = doc.css("p strong")[0].text.split(",")[2].lstrip # << country of first beach
    beach.insta_appeal = doc.css("p")[7].text
    beach.fun_fact = doc.css("p")[8].text
    beach.travel_tips = doc.css("p")[9].text
    beach
  end
end
