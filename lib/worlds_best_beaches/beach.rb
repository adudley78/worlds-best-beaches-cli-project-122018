class WorldsBestBeaches::Beach

  attr_accessor :name, :location, :more_info

  @@all = []

    # takes in an argument
  def self.new_from_page(b)
    self.new(b.css('.glide-slide.image-slide')[24].css('h3').text.strip.sub!( /\A.{3}/m, "" ), b.css('.glide-slide.image-slide')[24].css('div.glide-slide-desc p a strong').text.strip, b.css('.glide-slide.image-slide')[24].css('div.glide-slide-desc p[4]').text.strip)
  end

  # instatiates and stores new instances of beach objects with three attributes
  def initialize(name = nil, location = nil, more_info = nil)
    @name = name
    @location = location
    @more_info = more_info
    @@all << self
  end

  def self.all
    @@all
  end

end
