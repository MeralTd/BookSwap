class AddUnconfirmedToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :other_book_id, :integer
  end
end
