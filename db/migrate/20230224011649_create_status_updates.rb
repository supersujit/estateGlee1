class CreateStatusUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :status_updates do |t|
      t.integer :status
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
