class Place < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :photos
  geocoded_by :address
  after_validation :geocode
  validates :name, :presence => true, length: { minimum: 3 }
  validates :address, :presence => true
  validates :description, :presence => true

  # def avg_rating
  #   rating_integers = []
  #   Place.comments.each do |c|
  #     rating_integers << c.rating[0].to_i
  #   end

  # rating_integers.sum.to_f / rating_integers.length
  # end
end