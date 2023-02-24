class Comment < ApplicationRecord
  include RecordHistoryConcern

  validates_presence_of :title, :body, :user, :property
  belongs_to :user
  belongs_to :property

  private

  def history_item_summary
    "#{user.email} commented: #{body}."
  end

end
