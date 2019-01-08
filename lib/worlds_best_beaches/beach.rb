# instatiates a new parent class and child class
class WorldsBestBeaches::Beach

  # creates callable methods or attributes or properties for each Beach instance
  attr_accessor :name, :location, :more_info # might want to add best time of year to visit in the future

  # @@all = []
  #
  # def initialize(name = nil, location = nil, more_info = nil)
  #   @name = name
  #   @location = location
  #   @more_info = more_info
  #   @@all << self
  # end
  #
  # def self.all
  #   @@all
  # end

  # returns a collection of instances of Beach objects
  def self.today
    self.scrape_beaches
  end

  # going to need an initialize method and I want to use .send to practice mass assignment if possible
  def self.scrape_beaches
    beaches = []
    beaches << self.scrape_tripadvisor
    beaches
  end

  def self.scrape_tripadvisor
    doc = Nokogiri::HTML(open("https://www.coastalliving.com/tripadvisor-best-beaches-world"))
    beach = self.new
    # beach.name = doc.search('.glide-slide.image-slide').map{|b| b.search('h3').text.strip.sub!( /\A.{3}/m, "" )}
    beach.name = doc.search('.glide-slide.image-slide').search('h3').text.strip.sub!( /\A.{3}/m, "" )
    #binding.pry
    beach.location = doc.search('.glide-slide.image-slide').search('.glide-slide-desc p a strong').text.strip.sub!( /\A.{120}/m, "" )
    # beach.location = doc.search('.glide-slide.image-slide').search('div.glide-slide-desc p a strong').text.strip
    beach.more_info = doc.search('.glide-slide.image-slide').search('div.glide-slide-desc p[4]').text.strip
    #beach.location = doc.search('.glide-slide.image-slide').map{|b| b.search('div.glide-slide-desc p a strong').text.strip} # << location of first beach
    # beach.more_info = doc.search('.glide-slide.image-slide').map{|b| b.search('div.glide-slide-desc p[4]').text.strip} # << more info about the first beach
    beach
    #binding.pry
  end

end
