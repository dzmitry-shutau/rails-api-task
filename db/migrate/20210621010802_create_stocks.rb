class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :name, null: false
      t.references :bearer

      t.timestamps
    end
  end
end
