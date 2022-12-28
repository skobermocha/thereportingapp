# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# Uncomment the following to create an Admin user for Production in Jumpstart Pro
User.create name: "Admin", email: "admin@thereportingapp.com", password: "admin", password_confirmation: "admin", admin: true, terms_of_service: true


### Zipcode for CZ lookup
csv_text = File.read(Rails.root.join('lib', 'seeds', 'CZByZIPCode.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Czlookup.new
  t.zipcode = row['zipcode']
  t.climatezone = row['climatezone']
  t.save
  #puts "#{t.zipcode}, #{t.climatezone} saved"
end

puts "There are now #{Czlookup.count} rows in the ClimateZone table"