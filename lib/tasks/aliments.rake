desc "Fetch Aliments"
task :fetch_aliments => :environment do


require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'
require 'rails/all'


@name = []
@calories = []
@portions = []



def format_url(letter,number)
	"http://www.tabledescalories.com/aliments-boissons-"+letter+"-p"+number.to_s+".html"
end


def scrap_letter(letter,name,calories,portions)	
    begin
	(1..100).each do |page|
		begin
			url = format_url(letter,page)
	
			doc = Nokogiri::HTML(open(url))

			puts 'on recupere les noms'
			doc.css("#listeAliments a").each do |item|
  				name << item.text
			end

			puts 'on recupere les calories'
			doc.css("#listeAliments td:nth-child(2)").each do |item|
  				calories << item.text
			end

			puts 'on recupere la portion'
			doc.css("em").each do |item|
  				portions << item.text
			end


		rescue Exception => ex
  			puts "Error: #{ex}"
  			
		end
	end
	rescue Exception => ex
  		puts "Error: #{ex}"
  		
	end

end


filename = 'csvout.csv'

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