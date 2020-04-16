class Api
    def self.daily_horoscope(zodiac)
        url = "http://horoscope-api.herokuapp.com/horoscope/today/#{zodiac}"
        response = Net::HTTP.get(URI(url))
        
        horoscope_data = JSON.parse(response)
        instance = Horoscope.new(year: horoscope_data["year"], month: horoscope_data["month"],week: horoscope_data["week"],date: horoscope_data["date"], zodiac: horoscope_data["sunsign"], horoscope_info: horoscope_data["horoscope"])
    end

    def self.weekly_horoscope(zodiac)
        url = "http://horoscope-api.herokuapp.com/horoscope/week/#{zodiac}"
        response = Net::HTTP.get(URI(url))
        horoscope_data = JSON.parse(response)
        instance = Horoscope.new(year: horoscope_data["year"], month: horoscope_data["month"],week: horoscope_data["week"],date: horoscope_data["date"], zodiac: horoscope_data["sunsign"], horoscope_info: horoscope_data["horoscope"])
    end

    def self.monthly_horoscope(zodiac)
        url = "http://horoscope-api.herokuapp.com/horoscope/month/#{zodiac}"
        response = Net::HTTP.get(URI(url))
        horoscope_data = JSON.parse(response)
        instance = Horoscope.new(year: horoscope_data["year"], month: horoscope_data["month"],week: horoscope_data["week"],date: horoscope_data["date"], zodiac: horoscope_data["sunsign"], horoscope_info: horoscope_data["horoscope"])
    end

    def self.yearly_horoscope(zodiac)
        url = "http://horoscope-api.herokuapp.com/horoscope/year/#{zodiac}"
        response = Net::HTTP.get(URI(url))
        horoscope_data = JSON.parse(response)
        instance = Horoscope.new(year: horoscope_data["year"], month: horoscope_data["month"],week: horoscope_data["week"],date: horoscope_data["date"], zodiac: horoscope_data["sunsign"], horoscope_info: horoscope_data["horoscope"])
    end

end