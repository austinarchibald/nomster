class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  after_create :send_comment_email

  STAR = '&#9733'.html_safe

  RATINGS = {
    STAR                              => '1_star',
    STAR + STAR                       => '2_stars',
    STAR + STAR + STAR                => '3_stars',
    STAR + STAR + STAR + STAR         => '4_stars',
    STAR + STAR + STAR + STAR + STAR  => '5_stars'
  }

  def humanized_rating
    RATINGS.invert[self.rating]
  end

  def send_comment_email
      NotificationMailer.comment_added(self).deliver
  end
end


