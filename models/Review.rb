class Review
  attr_accessor :display_title, :mpaa_rating, :critics_pick, :byline, :headline, :summary_short, :publication_date, 
                :opening_date, :date_updated, :link, :multimedia, :director

  def initialize(params)
    params.each do |key, value|
      self.send(("#{key}="), value)
    end
  end

  def capitalize_attribute(attribute)
#attribute.split("_").map {|element| element.capitalize}.join(" ")
  end

  def stringify_attributes(nytimes_scraper)
    self.director = nytimes_scraper.get_director
    puts ""
    puts "Title: #{display_title}"
    puts "Review by: #{byline}"
    puts "This movie premiered on #{opening_date}." unless opening_date.nil?
    puts "This review appeared in the Times on #{publication_date}." unless publication_date.nil?
    if critics_pick == 1
      puts "*CRITICS PICK*"
    end
    puts "MPAA Rating: #{mpaa_rating}"
    puts "Directed by #{director}." unless director == ""
    puts "Summary: #{summary_short.gsub("&quot;", "\"")}\n"
    puts "The review can be read at #{link["url"]}"
  end

end