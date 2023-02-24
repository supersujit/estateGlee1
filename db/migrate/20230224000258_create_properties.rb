class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :zip
      t.text :description
      t.string :picture_url
      t.integer :status

      t.timestamps
    end
  end
end
