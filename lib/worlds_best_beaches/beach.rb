# instantiate a Beach class inside a module
class WorldsBestBeaches::Beach # refactor scrape-related methods into separate Scraper class

  # create reader/writer methods / attributes or properties for each beach object
  attr_accessor :name, :location, :more_info # add best time of year to visit

  @@all = []

  # initialize a beach instance with these properties and add to array
  def initialize(name=nil, location=nil, more_info=nil) # refactor with mass assignment pattern
    @name = name
    @location = location
    @more_info = more_info
    @@all << self
  end

  # call all beach objects and reverse the order for display purposes
  def self.all
    @@all.reverse # refactor with separate method that reverses the order
  end

  # initiate the scrape
  def self.today
    self.scrape_tripadvisor
  end

  # create new beach objects from scraped data
  def self.scrape_tripadvisor
    doc = Nokogiri::HTML(open("https://www.coastalliving.com/tripadvisor-best-beaches-world"))
    doc.search('.glide-slide.image-slide').each.with_index do |b, i|
      # refactor with case statement
      if i == 0
        location = b.search('.glide-slide-desc p a strong').text.split("!")[1][0..15]
      elsif i == 1
        location = b.search('.glide-slide-desc p a strong').text[0..35]
      elsif i == 4
        location = b.search('.glide-slide-desc p a strong').text[0..22]
      elsif i == 5
        location = b.search('.glide-slide-desc p a strong').text[0..17]
      elsif i == 12
        location = b.search('.glide-slide-desc p a strong').text[0..19]
      elsif i == 13
        location = b.search('.glide-slide-desc p a strong').text[0..29]
      elsif i == 14
        location = b.search('.glide-slide-desc p a strong').text[0..25]
      elsif i == 18
        location = b.search('.glide-slide-desc p a strong').text[0..19]
      elsif i == 20
        location = b.search('.glide-slide-desc p a strong').text[0..33]
      elsif i == 21
        location = b.search('.glide-slide-desc p a strong').text[0..15]
      elsif i == 22
        location = b.search('.glide-slide-desc p a strong').text[0..16]
      elsif i == 23
        location = b.search('.glide-slide-desc p a strong').text[0..31]
      else
        location = b.search('.glide-slide-desc p a strong').text
      end
      name = b.search('h3').text.strip.sub!( /\A.{3}/m, "" ).gsub(/\W/, ' ').strip
      if i == 1
        more_info = b.search('div.glide-slide-desc p')[2].text
      else
        more_info = b.search('div.glide-slide-desc p').last.text
      end
      self.new(name, location, more_info) # instantiate new beach objects from scraped data with three properties
    end
  end

end
