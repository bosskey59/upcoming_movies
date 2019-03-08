class Movie
    attr_accessor :url, :score, :rating, :description, :duration
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self

    end

    def self.all
        @@all
    end
end