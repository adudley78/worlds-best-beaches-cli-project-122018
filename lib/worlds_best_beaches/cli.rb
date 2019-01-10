# instantiate a new CLI class inside a module
class WorldsBestBeaches::CLI

  # start a new CLI session
  def call
    WorldsBestBeaches::Beach.today # call the scrape
    list_beaches
    menu
  end

  # list beaches
  def list_beaches
    puts " "
    puts "Welcome to the World's Best Beaches!"
    puts "Where do YOU want to explore today?"
    puts " "
    @beaches = WorldsBestBeaches::Beach.all # load all beach objects
    @beaches.each.with_index(1) do |beach,i|
      puts "#{i}. #{beach.name} - #{beach.location}"
    end
  end

  # print more info
  def menu
    input = nil
    while input != "quit"
      puts " "
      puts "Please enter the number of the beach you'd like to learn more about and hit enter or type list to see the list of beaches again or type quit to exit."
      puts " "
      input = gets.strip.downcase # get user input
      if input.to_i > 0 && input.to_i < 26
        beach = @beaches[input.to_i-1]
          puts " "
          puts "#{beach.more_info}"
          puts " "
          submenu
      elsif input == "list"
        list_beaches
      elsif input == "quit"
        goodbye
      else
        puts " "
        puts "We're not sure what you want. Type a number, list, or quit and hit enter." # << This is displayed before the puts of the goodbye method when user enters 'exit'. Need to fis.
      end
    end
  end

  def submenu
    input = nil
    # while input != "n" || input != "N"
      puts " "
      puts "Would like a link to learn even more? Type Y or N."
      puts " "
      input = gets.strip.downcase # get user input
      if input == "y" || input == "Y"
        puts " "
        puts "[Link for more info]"
        puts " "
      # else
      #   puts " "
      #   puts "We're not sure what you want. Type y or n and hit enter." # << This is displayed before the puts of the goodbye method when user enters 'exit'. Need to fis.
      end
    # end
  end

  # print exit messagge
  def goodbye
    puts " "
    puts "Thanks for using Worlds Best Beaches. Come back soon!"
    puts " "
  end

end
