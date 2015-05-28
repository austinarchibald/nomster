class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  @@star = '&#9733'.html_safe

  RATINGS = {
    @@star                                      => '1_star',
    @@star + @@star                             => '2_stars',
    @@star + @@star + @@star                    => '3_stars',
    @@star + @@star + @@star + @@star           => '4_stars',
    @@star + @@star + @@star + @@star + @@star  => '5_stars'
  }

  def humanized_rating
    RATINGS.invert[self.rating]
  end
end
