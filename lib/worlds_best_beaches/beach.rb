class WorldsBestBeaches::Beach

  attr_accessor :name, :location, :more_info

  @@all = []

  def self.new_from_page(b)
    self.new(b.css('h3').text,
    css('.glide-slide.image-slide')[24].css('div.glide-slide-desc p a strong').text,
    css('.glide-slide.image-slide')[24].css('div.glide-slide-desc p[4]').text))
  end

  def initialize(name = nil, location = nil, more_info = nil)
    @name = name
    @location = location
    @more_info = more_info
    @@all << self
  end

  def self.all
    @@all
  end
