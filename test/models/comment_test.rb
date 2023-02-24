require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test 'should be invalid without title' do
    comment = comments(:one)
    comment.title = nil
    assert_not comment.valid?
  end

  test 'should be invalid without body' do
    comment = comments(:one)
    comment.body = nil
    assert_not comment.valid?
  end

  test 'should be invalid without user' do
    comment = comments(:one)
    comment.user_id = nil
    assert_not comment.valid?
  end

  test 'should be invalid without property' do
    comment = comments(:one)
    comment.property_id = nil
    assert_not comment.valid?
  end

  test 'should create a new history item on creation' do
    comment = comments(:one)
    assert_difference("HistoryItem.count") do
      comment.save
    end
  end
end
