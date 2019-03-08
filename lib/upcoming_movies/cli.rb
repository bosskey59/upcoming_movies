class CLI 
    def run
       welcome
       get_movies
       display_menu
    end

    def welcome
        puts"Welcome to upcoming movies!!"
    end
    
    def get_movies
        Scraper.find_movies
    end

    def display_menu
        puts "Please select a valid number."
        Movie.all.each_with_index do |movie, index|
            puts "#{index+1}) #{movie.name}"
        end
        num = gets.chomp
        movie = Movie.all[num.to_i-1]

        if movie == nil
            puts "Invalid Entry!"
            self.display_menu
        else
            Scraper.get_movie_details(movie)
        end

        display_details(movie)
    end

    def display_details(movie)
        puts "Name | " + movie.name
        if movie.score != ""
            puts "Score | " + movie.score
        end
        if movie.duration != nil
            puts "Duration | " + movie.duration
        end
        puts "Description | " + movie.description

        continue
    end

    def continue
        puts "________________________________________________"
        puts "Would you like to select another movie? (y/n)"
        user_input = gets.chomp.downcase
        if user_input == "y"
            display_menu
        elsif user_input == "n" 
            puts "BYE BYE"
            # exit!
        else
           puts "Invalid Entry!" 
           continue
        end
    end
end