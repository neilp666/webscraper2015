class Movie < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true
  validates :hotness, :numericality => {:allow_blank => true}
  vaiidates :image_url, :url => {:allow_blank => true}
end
