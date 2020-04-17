class Horoscope
    attr_accessor :zodiac, :day_info, :week_info, :month_info, :year_info, :day, :week, :month, :year
    @@all = []

    
   def initialize(zodiac)
        @zodiac = zodiac
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_zodiac(zodiac)
        @@all.find {|z| z.zodiac == zodiac }
    end
end
