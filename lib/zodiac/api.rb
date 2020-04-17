class Api
    def self.daily_horoscope(zodiac)
        url = "http://horoscope-api.herokuapp.com/horoscope/today/#{zodiac.zodiac}"
        response = Net::HTTP.get(URI(url)) 
        horoscope_data = JSON.parse(response)

        zodiac.day = horoscope_data["date"]
        zodiac.day_info = horoscope_data["horoscope"]

    end

    def self.weekly_horoscope(zodiac)
        url = "http://horoscope-api.herokuapp.com/horoscope/week/#{zodiac.zodiac}"
        response = Net::HTTP.get(URI(url))
        horoscope_data = JSON.parse(response)
        #binding.pry

        zodiac.week = horoscope_data["week"]
        zodiac.week_info = horoscope_data["horoscope"]
    end

    def self.monthly_horoscope(zodiac)
        url = "http://horoscope-api.herokuapp.com/horoscope/month/#{zodiac.zodiac}"
        response = Net::HTTP.get(URI(url))
        horoscope_data = JSON.parse(response)
         
        zodiac.month = horoscope_data["month"]
        zodiac.month_info = horoscope_data["horoscope"]
        zodiac.month_info.split(/[\[\]]/)
        zodiac.month_info = self.join("")

    end

    def self.yearly_horoscope(zodiac)
        url = "http://horoscope-api.herokuapp.com/horoscope/year/#{zodiac.zodiac}"
        response = Net::HTTP.get(URI(url))
        horoscope_data = JSON.parse(response)

        zodiac.year = horoscope_data["year"]
        zodiac.year_info = horoscope_data["horoscope"]
    end

end