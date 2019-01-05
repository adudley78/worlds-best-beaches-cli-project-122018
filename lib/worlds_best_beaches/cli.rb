# CLI Controller
class WorldsBestBeaches::CLI

  # runs the scraper so new beach instances (objects) are created and availabe to be listed
  def call
      WorldsBestBeaches::Scraper.new.make_beaches
      "Welcome to the World's Best Beaches - Discover, Learn, Explore"
      list_beaches
  end

  # lists beach objects
  def list_beaches

    input = nil

    while input != "exit"
      puts "Please enter the number of the beach you'd like to learn more about or type list to see the list of beaches again or type exit."
      input = gets.strip.downcase
      if input.to_i > 0
        the_beach = @beaches[input.to_i-1]
        puts "#{the_beach.more_info}"
      elsif input == "list"
        list_beaches
      else
        puts "We're not sure what you want. Type a number, list, or exit." # << This is displayed before the puts of the goodbye method when user enters 'exit'. Need to fis.
      end

  end

  def print_beach(beach)
    puts ""
    puts "----------- #{beach.name} - #{beach.location} -----------"
    puts ""
    puts "Location:           #{beach.location}"
    puts "Head Chef:          #{beach.head_chef}"
    puts "Style of Food:      #{beach.food_style}"
    puts "Standout Dish:      #{beach.best_dish}"
    puts "Contact:            #{beach.contact}"
    puts "Website:            #{beach.website_url}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{beach.description}"
    puts ""
  end

  def print_beach(from_number)
    puts ""
    puts "---------- Beach #{from_number} - #{from_number+24} ----------"
    puts ""
    WorldsBestBeach::Beach.all[from_number-1, 10].each.with_index(from_number) do |beach, index|
      puts "#{index}.#{beach.name} - #{beach.location}"
    end
  end
end

end
