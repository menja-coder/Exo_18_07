require 'nokogiri'
require 'open-uri'
require 'rubygems'
require 'pry'
#Load URL
def url_load
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  return page
end

#Fetch the name of crypto

def crypto_names_fetch
	page = url_load
	crypto_names = page.xpath('//*[@class = "text-left col-symbol"]')
	crypto_names_to_array = []
	crypto_names.each do |name| 
		crypto_names_to_array << name.text
	 end
	 return crypto_names_to_array
end

#Fetch the price of the cryptomoney

def crypto_price_fetch
	page = url_load
	crypto_price = page.xpath('//*[@class = "price"]')
	crypto_price_to_array = []
	crypto_price.each do |price| 
		crypto_price_to_array << price.text[1..-1].to_f
	end
	
	 return crypto_price_to_array
end

#Puts them into hash

def crypto_scrap
	crypto_names_to_array = crypto_names_fetch
	crypto_price_to_array = crypto_price_fetch

	result = []
	crypto_names_to_array.each_with_index do |key, value|  
		 result << {key:(crypto_price_to_array)[value]}
		 end
		print result
	return result
end
crypto_scrap





