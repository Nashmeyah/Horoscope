class Cli
    ZODIAC_SIGN = %w[aries taurus gemini cancer leo virgo libra scorpio sagittarius capricorn aquarius pisces]

    def run
        # ZODIAC_SIGN.each {|z| @zodiac_horoscope = Horoscope.new(z)}

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
        Api.daily_horoscope(@zodiac) if !Horoscope.find_by_zodiac(@zodiac, @horoscope_choice)
        Horoscope.all.each do |info|
            puts " "
            puts " Here is your Daily Horoscope for #{info.date}".colorize(:green)
            puts " "
            puts " #{info.zodiac.upcase}"
            puts " "
            puts " #{info.horoscope_info}".colorize(:yellow)
        end
    end

        def zodiac_week
            Api.weekly_horoscope(@zodiac) if !Horoscope.find_by_zodiac(@zodiac, @horoscope_choice) 
            Horoscope.all.each do |info|
                puts " "
                puts " Here is your Weekly Horoscope for #{info.week}".colorize(:green)
                puts " "
                puts " #{info.zodiac.upcase}"
                puts " "
                puts " #{info.horoscope_info}".colorize(:yellow)
            end
        end

        def zodiac_month
            Api.monthly_horoscope(@zodiac) if !Horoscope.find_by_zodiac(@zodiac, @horoscope_choice)
            Horoscope.all.each do |info|
                puts " "
                puts " Here is your Monthly Horoscope for #{info.month}".colorize(:green)
                puts " "
                puts " #{info.zodiac.upcase}"
                puts " "
                puts " #{info.horoscope_info}".colorize(:yellow)
            end
        end
    
        def zodiac_year
            Api.yearly_horoscope(@zodiac) if !Horoscope.find_by_zodiac(@zodiac,@horoscope_choice)
            Horoscope.all.each do |info|
                puts " "
                puts " Here is your Yearly Horoscope for #{info.year}".colorize(:green)
                puts " "
                puts " #{info.zodiac.upcase}"
                puts " "
                puts " #{info.horoscope_info}".colorize(:yellow)
            end
        end
end