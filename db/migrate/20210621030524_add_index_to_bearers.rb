class AddIndexToBearers < ActiveRecord::Migration[6.0]
  def change
    add_index :bearers, :name, unique: true
  end
end
