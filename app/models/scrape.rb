class Scrape

attr_accessor :title, :hotness, :image_url, :rating, :genre, :release_date, :runtine, :synopsis, :rating

def scrape_new_movie
    begin 
      doc = Nokogiri::HTML(open("http://www.rottentomatoes.com/m/the_martian/"))

      doc.css('script').remove

      self.title = doc.at("//h1[@itempro = 'name']").text
      self.hotness = doc.at("//span[@itempro = 'ratingValue']").text.to_i
      self.image_url = doc.at_css('#movie-image-section img')['src']
      self.rating = doc.at("//td[@itemgroup = 'contentRating']").text
      self.director = doc.at("//span@itemgroup = 'name']").text
      self.genre = doc.at("//span@itemprop = 'genre']").text
      self.release_date = doc.at("//td@itemgroup = 'datePublished']").text.to_date
      self.runtime = doc.at("//time[@itemprop = 'duration']").text
      self.synopsis = doc.css("#movieSynopsis").text
      return true
    rescue Exception => e
      self.failure = "Something went wrong with the scrape"
    end
  end
end
