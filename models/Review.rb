class Review
  attr_accessor :display_title, :mpaa_rating, :critics_pick, :byline, :headline, :summary_short, :publication_date, :opening_date, :date_updated, :link, :multimedia

  def initialize(params)
    params.each do |key, value|
      self.send(("#{key}="), value)
    end
  end

end