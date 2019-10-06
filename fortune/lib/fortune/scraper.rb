class Fortune::Scraper
    
    def self.get_card_data
        html = open("https://www.tarot.com/tarot/cards/major-arcana")
        doc = Nokogiri::HTML(html)
        names = []
        meanings = []
        
        doc.css("row.is-wrap h2").each {|h2| names << h2.text.delete("#") }
        #all the card names are h2 elements except the last one which is an h3 with additional text
        names << doc.css("row.is-wrap h3").text.split("  ")[0].delete("#")
        doc.css("row.is-wrap p").each {|meaning| meanings << meaning.text.split("Learn")[0] }

        i = 0
        while i < 22 do
            Fortune::Card.new(names[i],meanings[i])
            i += 1
        end 
    end
end
