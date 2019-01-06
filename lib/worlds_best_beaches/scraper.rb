# scrape website for data and
class WorldsBestBeaches::Scraper

  # gets the webpage to be scraped
  def self.get_page
    Nokogiri::HTML(open("https://www.coastalliving.com/tripadvisor-best-beaches-world"))
  end

  # scrapes desired data from page
  def self.scrape_beaches
    data = self.get_page.css('.glide-slide.image-slide')
  end

  # creates a new beach object for each of the 25 beaches
  def self.make_beaches
     scrape_beaches.each do |b|
      WorldsBestBeaches::Beach.new_from_page(b)
    end
  end

end
