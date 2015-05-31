require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test "humanized_rating" do    
    comment = FactoryGirl.create(:comment)
    # puts comment.inspect
  expected = "&#9733&#9733&#9733&#9733&#9733"
  actual = comment.humanized_rating
  assert_equal expected, actual   
  end

end