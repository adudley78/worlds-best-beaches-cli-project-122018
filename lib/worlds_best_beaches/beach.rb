# instatiates a new parent class and child class
class WorldsBestBeaches::Beach

  # creates callable methods or attributes or properties for each Beach instance
  attr_accessor :name, :location, :more_info # might want to add best time of year to visit in the future

  @@all = []

  def initialize(name=nil, location=nil, more_info=nil)
    @name = name
    @location = location
    @more_info = more_info
    @@all << self
  end

  def self.all
    @@all.reverse
  end

  # returns a collection of instances of Beach objects
  def self.today
    self.scrape_tripadvisor
  end

  # get data from website to be scraped and create/save new beach objects
  def self.scrape_tripadvisor
    doc = Nokogiri::HTML(open("https://www.coastalliving.com/tripadvisor-best-beaches-world"))
    doc.search('.glide-slide.image-slide').each.with_index do |b, i|
      #
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
      self.new(name, location, more_info)
    end
  end

end
