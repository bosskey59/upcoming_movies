class Scraper
    
    URL = "https://www.imdb.com/"

    def self.find_movies
        file = open(URL)
        doc = Nokogiri::HTML(file)


        movies = doc.css(".rhs-body")[0].css(".title")
        movies.each do |movie|
            name = movie.text.strip
            url = movie.css("a").first["href"]
            Movie.new(name).tap {|m| m.url = url}
        end
    end

    def self.get_movie_details(movie)
        url = URL + movie.url
        doc = Nokogiri::HTML(open(url))
        movie.score = doc.css(".ratingValue").text.strip
        # movie.rating = doc.css(".subtext").text.split("\n")[1].strip
        movie.description = doc.css(".summary_text").text.strip

        subtext = doc.css(".subtext").text.split("\n")
        subtext.select!{ |string| string.include?("min")}
        if(subtext.first != nil)
            movie.duration = subtext.first.strip
        end
    end

end