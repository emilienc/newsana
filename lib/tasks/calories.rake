desc "Fetch Caloriess"
task :fetch_calories => :environment do


	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'
	require 'csv'
	require 'rails/all'


	@name = []
	@calories = []
	@portions = []



    def format_url(letter)
	   "http://www.les-calories.com/calories-"+letter+".html"
    end


    def scrap_letter(letter,name,calories,portions)	
    
			url = format_url(letter)
	
			doc = Nokogiri::HTML(open(url))

			puts 'on recupere les noms'
			doc.css("td td a").each do |item|
  				name << item.text
                puts name
			end

			puts 'on recupere les calories'
			doc.css("td td td td:nth-child(2) .text3").each do |item|
  				calories << item.text
                puts calories
			end

			puts 'on recupere la portion'
			doc.css("td:nth-child(6) .text3").each do |item|
  				portions << item.text
                puts portions
			end

    end


    filename = 'csvout_calories.csv'

    CSV.open(filename, 'w') do |csv|
	   
       csv << ['name','calories','portion']
	   
       ("a".."z").each do |letter|
		  puts 'scrapping letter ' + letter
		  scrap_letter(letter,@name,@calories,@portions)
		  puts 'writing letter ' + letter
		  @name.length.times do |i|
	 		csv << [@name[i],@calories[i],@portions[i]]
		  end
	      @name = []
          @calories = []
          @portions = []
        end
    end

end