class AddDeletedAtToStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :deleted_at, :datetime
  end
end
