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
  #   rating_vals = []
  #   Comment.where(:place_id => @place).each do |c|
  #       rating_vals << c.rating[0].to_f
  #   end

  #   rating_vals.sum.to_f / rating_vals.length
  # end
end