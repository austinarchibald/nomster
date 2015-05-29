class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  after_create :send_comment_email

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

  def send_comment_email
      NotificationMailer.comment_added(self).deliver
  end

end


