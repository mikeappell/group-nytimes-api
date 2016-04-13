class Review
  attr_accessor :display_title, :mpaa_rating, :critics_pick, :byline, :headline, :summary_short, :publication_date, 
                :opening_date, :date_updated, :link, :multimedia

  def initialize(params)
    params.each do |key, value|
      self.send(("#{key}="), value)
    end
  end

  def stringify_attributes
    puts ""
    puts "Title: #{display_title}"
    puts "Review by: #{byline}"
    if critics_pick == 1
      puts "*CRITICS PICK*"
    end
    puts "MPAA Rating: #{mpaa_rating}"
    puts "Summary: #{summary_short}"
  end

end