# CLI Controller
# What does the following mean?
class WorldsBestBeaches::CLI

  # called upon user starting new CLI session
  def call
    # WorldsBestBeaches::Scraper.new.make_beachs
    list_beaches
    menu
    goodbye
    # start
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
    while input != "exit" # accomodate for cases
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

#
#   def start
#     puts ""
#     puts "What number beaches would you like to see? 1-10, 11-20, 21-30, 31-40 or 41-50?"
#     input = gets.strip.to_i
#
#     print_beaches(input)
#
#     puts ""
#     puts "Which beach would you like to learn more about?"
#     input = gets.strip
#
#     beach = WorldsBestBeaches::Beaches.find(input.to_i)
#
#     print_beach(beach)
#
#     puts ""
#     puts "Would you like to see another beach? Enter Y or N"
#
#     input = gets.strip.downcase
#     if input == "y"
#       start
#     elsif input == "n"
#       puts ""
#       puts "Thank you! Have a great day!"
#       exit
#     else
#       puts ""
#       puts "I don't understand that answer."
#       start
#     end
#   end
#
#   def print_beach(beach)
#     puts ""
#     puts "----------- #{beach.name} - #{beach.position} -----------"
#     puts ""
#     puts "Location:           #{beach.location}"
#     puts "Head Chef:          #{beach.head_chef}"
#     puts "Style of Food:      #{beach.food_style}"
#     puts "Standout Dish:      #{beach.best_dish}"
#     puts "Contact:            #{beach.contact}"
#     puts "Website:            #{beach.website_url}"
#     puts ""
#     puts "---------------Description--------------"
#     puts ""
#     puts "#{beach.description}"
#     puts ""
#   end
#
#   def print_beaches(from_number)
#     puts ""
#     puts "---------- Beaches #{from_number} - #{from_number+9} ----------"
#     puts ""
#     WorldsBestBeaches::Beach.all[from_number-1, 10].each.with_index(from_number) do |beach, index|
#       puts "#{index}. #{beach.name} - #{beach.location}"
#     end
#   end
#
