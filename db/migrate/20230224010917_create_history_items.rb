class CreateHistoryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :history_items do |t|
      t.integer :historicizable_id
      t.string :historicizable_type
      t.references :property, null: false, foreign_key: true
      t.timestamps
    end
  end
end
