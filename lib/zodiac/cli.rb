class Cli
    ZODIAC_SIGN = %w[aries taurus gemini cancer leo virgo libra scorpio sagittarius capricorn aquarius pisces]

    def run
        ZODIAC_SIGN.each {|z| Horoscope.new(z)}
        puts " "
        puts "  Hello! Welcome to Zodiac Horoscopes!".colorize(:blue).on_white
        puts "  You can view Daily, Weekly, Monthly or Yearly horoscope of any zodiac sign!".colorize(:blue).on_white.underline
        puts " "
        while @zodiac != "exit" do
            puts "Enter a zodiac sign you would like to see, or enter exit once youre done!".colorize(:cyan)
            ZODIAC_SIGN.each do |sign|
                puts " #{sign.capitalize}"
            end
            @zodiac = gets.strip.downcase
            
        
            if ZODIAC_SIGN.include? @zodiac
                puts " "
                puts "Enter which horoscope would you like to see.".colorize(:yellow)
                puts " "
                puts " Daily".colorize(:red)
                puts " Weekly".colorize(:red)
                puts " Monthly".colorize(:red)
                puts " Yearly".colorize(:red)
                puts " "
                @horoscope_choice = gets.strip.downcase
                
                case @horoscope_choice
                when "daily" 
                    zodiac_daily             
                when "weekly"
                    zodiac_week
                when "monthly"
                    zodiac_month
                when "yearly"   
                    zodiac_year          
                else
                    puts "Sorry, wrong selection! Enter it again."           
                end
            end           
        end
        puts "Bye!"

    end


    def zodiac_daily
        Api.daily_horoscope(Horoscope.find_by_zodiac(@zodiac)) if !Horoscope.find_by_zodiac(@zodiac).day_info
        horoscope = Horoscope.find_by_zodiac(@zodiac)
            puts " "
            puts " Here is your Daily Horoscope for #{horoscope.day}".colorize(:green)
            puts " "
            puts " #{horoscope.zodiac.upcase}"
            puts " "
            puts " #{horoscope.day_info}".colorize(:yellow)
            #binding.pry 
    end

    def zodiac_week
        
        Api.weekly_horoscope(Horoscope.find_by_zodiac(@zodiac)) if !Horoscope.find_by_zodiac(@zodiac).week_info
        #binding.pry
            horoscope = Horoscope.find_by_zodiac(@zodiac)
             
            puts " "
            puts " Here is your Weekly Horoscope for #{horoscope.week}".colorize(:green)
            puts " "
            puts " #{horoscope.zodiac.upcase}"
            puts " "
            puts " #{horoscope.week_info}".colorize(:yellow)
            #binding.pry     
    end

    def zodiac_month
        Api.monthly_horoscope(Horoscope.find_by_zodiac(@zodiac)) if !Horoscope.find_by_zodiac(@zodiac).month_info
        horoscope = Horoscope.find_by_zodiac(@zodiac)
            puts " "
            puts " Here is your Monthly Horoscope for #{horoscope.month}".colorize(:green)
            puts " "
            puts " #{horoscope.zodiac.upcase}"
            puts " "
            puts " #{horoscope.month_info}".colorize(:yellow)
            #binding.pry 
    end
    
    def zodiac_year
        Api.yearly_horoscope(Horoscope.find_by_zodiac(@zodiac)) if !Horoscope.find_by_zodiac(@zodiac).year_info
        horoscope = Horoscope.find_by_zodiac(@zodiac)
            puts " "
            puts " Here is your Yearly Horoscope for #{horoscope.year}".colorize(:green)
            puts " "
            puts " #{horoscope.zodiac.upcase}"
            puts " "
            puts " #{horoscope.year_info}".colorize(:yellow)            
    end
    
end