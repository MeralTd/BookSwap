class AddIndexesToSwaps < ActiveRecord::Migration[6.0]
  def change
  end
  add_index :swaps, :user_id
  add_index :swaps, :other_id
  add_index :swaps, :book_id
end
