class DeleteStatusFromProperties < ActiveRecord::Migration[7.0]
  def change
    remove_column :properties, :status
  end
end
