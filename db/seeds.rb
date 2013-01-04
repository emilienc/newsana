# encoding: UTF-8
require 'csv'
require 'rails/all'


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'ADMIN USER'
user = User.find_or_create_by_email :admin => true,:name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'CATEGORY_ACTIVITE'
CategoryActivite.create({ :name => 'vélo loisir', :MET=>4.5 })
CategoryActivite.create({ :name => 'vélo course', :MET=>10.0 })
CategoryActivite.create({ :name => 'vélo appartement', :MET=>7.0 })
CategoryActivite.create({ :name => 'marche' , :MET=>4.0})
CategoryActivite.create({ :name => 'course à pied', :MET=>7.0 })
puts 'ALIMENT'
filename = 'csvout_calories.csv'
CSV.foreach(filename, headers: true) do |row|
	puts row[0]
	@unite = Unite.find_or_create_by_name(row[3])
    Aliment.create!(name: row[0], calories: row[1], portion: row[2], unite_id: @unite.id  )
end