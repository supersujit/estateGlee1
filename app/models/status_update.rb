class StatusUpdate < ApplicationRecord
  include RecordHistoryConcern

  enum status: [:listed, :viewing, :financing, :payment, :sold]

  belongs_to :property
  belongs_to :user

  private

  def history_item_summary
    "#{user.email} changed status to: #{status}."
  end

end
