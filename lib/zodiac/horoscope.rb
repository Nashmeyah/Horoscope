class Horoscope
    attr_accessor :zodiac, :horoscope_info, :date, :week, :month, :year
    @@all = []

    
   def initialize(zodiac:, horoscope_info:, date:, week:, month:, year:)
        @zodiac = zodiac
        @horoscope_info = horoscope_info
        @date = date
        @week = week
        @month = month
        @year = year
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_zodiac(zodiac, horoscope_choice)
        @@all.find {|z| z.zodiac == zodiac && z.date == horoscope_choice || z.week == horoscope_choice || z.month == horoscope_choice || z.year == horoscope_choice}
    end
end
