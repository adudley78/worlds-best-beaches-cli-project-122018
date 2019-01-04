# CLI Controller
class WorldsBestBeaches::CLI

  # called upon user starting new CLI session
  def call
    list_beaches
    menu
    goodbye
  end

  # lists beaches, data scraped from site
  def list_beaches
    puts "Welcome to the World's Best Beaches - Discover, Learn, Explore"
    # Beach is a class method that calls all that returns the collection of beaches.
    @beaches = WorldsBestBeaches::Beach.all
    @beaches.each.with_index(1) do |beach,i|
      puts "#{i}. #{beach.name} - #{beach.city}, #{beach.country}"
    end
  end

  # takes user menu selection and displays more info about selection
  def menu
    input = nil
    while input != "exit"
      puts "Please enter the number of the beach you'd like to learn more about or type list to see the list of beaches again or type exit."
      input = gets.strip.downcase
      if input.to_i > 0
        the_beach = @beaches[input.to_i-1]
        puts "#{the_beach.insta_appeal} - #{the_beach.fun_fact}, #{the_beach.travel_tips}"
      elsif input == "list"
        list_beaches
      else
        puts "We're not sure what you want. Type a number, list, or exit."
      end
  end

    def goodbye
      puts "Thanks for using Worlds Best Beaches. Come back soon!"
    end
  end

end
