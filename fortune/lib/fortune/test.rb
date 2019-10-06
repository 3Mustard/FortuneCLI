require 'open-uri'
require 'nokogiri'
require 'pry'

html = open("https://www.tarot.com/tarot/cards/major-arcana")
doc = Nokogiri::HTML(html)

names = []
doc.css("row.is-wrap h2").each {|h2| names << h2.text} 
#all the card names are h2 elements except the last one which is an h3 with additional text
names << doc.css("row.is-wrap h3").text.split("  ")[0]

meanings = []
doc.css("row.is-wrap p").each {|meaning| meanings << meaning.text}
binding.pry

#names = ["#0 - The Fool", "#1 - The Magician", ect]