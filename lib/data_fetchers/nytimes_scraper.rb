class NYTimesScraper
  attr_reader :url, :review, :scraped_page

  def initialize(review)
    @review = review
    @url = review.link["url"]
    html = RestClient.get(url)
    @scraped_page = Nokogiri::HTML(html)
  end

  def get_director
    director_text = scraped_page.css("li span span.person").text
    unless director_text == ""
      director_text
    else
      director_text = scraped_page.css("p").detect { |p| p.text.include?("directed by") }
      unless director_text == "" || director_text.nil?
        director_text.text.match(/[dD]irected by (.+)/)[1]
      else ""
      end
    end
  end

  def get_review
    review_text = scraped_page.css("div.story-body p.story-body-text").text
    unless review_text == ""
      review_text
    else
      review_text = scraped_page.css("div#articleBody p")[1..-1].text.gsub("''", "\"")
    end
  end
end