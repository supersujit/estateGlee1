require "test_helper"

class StatusUpdateTest < ActiveSupport::TestCase
  test 'should create a new history item on creation' do
    status_update = status_updates(:one)
    assert_difference("HistoryItem.count") do
      status_update.save
    end
  end
end
