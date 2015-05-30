class Place < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :photos
  geocoded_by :address
  after_validation :geocode
  validates :name, :presence => true, length: { minimum: 3 }
  validates :address, :presence => true
  validates :description, :presence => true

  HALF = '&#189'.html_safe

  def avg_rating
    rating_vals = self.comments.map do |c|
        c.rating.to_i
    end
    r = rating_vals.sum.to_f / rating_vals.length
    if r >= 4.75
      avg_rating = Comment::STAR + Comment::STAR + Comment::STAR + Comment::STAR + Comment::STAR
    elsif r >= 4.25
      avg_rating = Comment::STAR + Comment::STAR + Comment::STAR + Comment::STAR + HALF
    elsif r >= 3.75
      avg_rating = Comment::STAR + Comment::STAR + Comment::STAR + Comment::STAR
    elsif r >= 3.25 
      avg_rating = Comment::STAR + Comment::STAR + Comment::STAR + HALF
    elsif r >= 2.75
      avg_rating = Comment::STAR + Comment::STAR + Comment::STAR
    elsif r >= 2.25
      avg_rating = Comment::STAR + Comment::STAR + HALF
    elsif r >= 1.75
      avg_rating = Comment::STAR + Comment::STAR
    elsif r >= 1.25
      avg_rating = Comment::STAR + HALF
    elsif r >= 0.75
      avg_rating = Comment::STAR
    elsif r >= 0.25
      avg_rating = HALF
    end
  end
end