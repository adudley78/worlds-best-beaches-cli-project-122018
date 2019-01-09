# CLI Controller
class WorldsBestBeaches::CLI

  # called upon user starting new CLI session
  def call
    WorldsBestBeaches::Beach.today
    list_beaches
    menu
    goodbye
  end

  # lists beaches, data scraped from site
  def list_beaches
    puts "Welcome to the World's Best Beaches - Discover, Learn, Explore"
    # Beach is a class method that calls all that returns the collection of beaches.
    #binding.pry
    @beaches = WorldsBestBeaches::Beach.all
    @beaches.each.with_index(1) do |beach,i|
      puts "#{i}. #{beach.name} - #{beach.location}"
    end
  end

  # takes user menu selection and displays more info about selection
  def menu
    input = nil
    while input != "exit"
      puts "Please enter the number of the beach you'd like to learn more about or type list to see the list of beaches again or type exit."
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 26
        beach = @beaches[input.to_i-1]
        # @beaches.each do |beach,i|
          puts "#{beach.more_info}"
      elsif input == "list"
        list_beaches
      elsif input == "exit"
        goodbye
      else
        puts "We're not sure what you want. Type a number, list, or exit." # << This is displayed before the puts of the goodbye method when user enters 'exit'. Need to fis.
      end
    end
  end

    def goodbye
      puts "Thanks for using Worlds Best Beaches. Come back soon!"
    end

  end
