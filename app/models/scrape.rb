class Scrape
  attr_accessor :title, :hotness, :image_url, :rating, :director,
  :genre, :release_date, :runtime, :synopsis, :failure

  def scrape_new_movie(url)
    begin
      doc = Nokogiri::HTML(open(url))

      doc.css('script').remove 
      self.title = doc.at("//span[@itemprop = 'name']").text  
      self.hotness = doc.at("//span[@itemprop = 'ratingValue']").text.to_i 
      self.image_url = doc.at_css('#movie-image-section img')['src'] 
      self.rating = doc.at("//td[@itemprop = 'contentRating']").text 
      self.director = doc.at("//td[@itemprop = 'director']").css('a').first.text 
      self.genre = doc.at("//span[@itemprop = 'genre']").text 
      self.release_date = doc.at("//td[@itemprop = 'datePublished']").text.to_date  
      self.runtime = doc.at("//time[@itemprop = 'duration']").text 
      self.synopsis = doc.css("#movieSynopsis").text.tidy_bytes
      return true
    rescue Exception => e
      self.failure = "Something went wrong with the scrape"
    end
  end
end
