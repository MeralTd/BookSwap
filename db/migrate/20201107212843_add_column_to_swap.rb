class AddColumnToSwap < ActiveRecord::Migration[6.0]
  def change
    add_column :swaps, :other_book_id, :integer
  end
end
