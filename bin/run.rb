require_relative '../config/environment.rb'

current_session = UserSession.new

while current_session && !current_session.current_user
    puts "\nPlease 'login' or 'signup' to countinue"

    case gets.chomp
    when "login"
        current_session.login
    when "signup"
        current_session.create_user
    when "help"
        puts current_session.commands
    when "exit"
        current_session = nil
    end

end

while current_session && current_session.current_user
    puts "\nWhat would like to do?"
    puts "Type 'help' for a list of commands"

    case gets.chomp
    when "help"
        puts current_session.commands
    when "temp"
        current_session.temp
    when "search"
        current_session.new_location
    when "locations"
        current_session.user_locations_list
    when "logout"
        current_session.logout
    when "whoami"
        current_session.whoami
    when "exit"
        current_session = nil
    when "delete"
        current_session.can_destroy_profile
    when "update"
        current_session.update_profile
    end

end

