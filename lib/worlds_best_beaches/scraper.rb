class WorldsBestBeaches::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.coastalliving.com/tripadvisor-best-beaches-world"))
  end

  def scrape_beaches
    self.get_page.css('.glide-slide.image-slide').css('h3').text.strip.sub!( /\A.{3}/m, "" )
  end

  def make_beaches
    scrape_beaches.each do |b|
      WorldsBestBeaches::Beach.new_from_page(b)
    end
  end

end
