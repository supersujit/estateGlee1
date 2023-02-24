class AddSummaryToHistoryItems < ActiveRecord::Migration[7.0]
  def change
    add_column :history_items, :summary, :string
  end
end
