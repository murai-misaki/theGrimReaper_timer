class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :guest, :boolean, default: false, null: false
    add_column :users, :privacy, :boolean, default: false, null: false
  end
end
