# instatiates a new parent class and child class
class WorldsBestBeaches::Beach

  # creates callable methods or attributes or properties for each Beach instance
  attr_accessor :name, :location, :more_info # might want to add best time of year to visit in the future

  # returns a collection of instances of Beach objects
  def self.all
    self.scrape_beaches
  end

  # going to need an initialize method and I want to use .send to practice mass assignment if possible

  def self.scrape_beaches
    beaches = []
    beaches << self.scrape_tripadvisor
    beaches
  end

  # scrapes the best beaches webpage and assigns predefined attributes to Beach objects
  # def self.scrape_tripadvisor
  #   doc = Nokogiri::HTML(open("https://www.coastalliving.com/tripadvisor-best-beaches-world"))
  #   # binding.pry
  #   beach = self.new
  #   beach.name = doc.css('.glide-slide.image-slide')[24].css('h3').text.strip.sub!( /\A.{3}/m, "" ) # << gives me the name of the first beach
  #   beach.location = doc.css('.glide-slide.image-slide')[24].css('div.glide-slide-desc p a strong').text.strip # << location of first beach
  #   beach.more_info = doc.css('.glide-slide.image-slide')[24].css('div.glide-slide-desc p[4]').text.strip # << more info about the first beach
  #   beach
  # end

  

end
