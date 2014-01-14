Url.destroy_all

url1 = Url.create!(url: "veterinariansny")
url2 = Url.create!(url: "surgeonny")
url3 = Url.create!(url: "electriciansny")
url4 = Url.create!(url: "landscapersny")
url5 = Url.create!(url: "optometristny")

puts "#{url1.url} was created!"