class CreateSwaps < ActiveRecord::Migration[6.0]
  def change
    create_table :swaps do |t|
      t.integer :user_id
      t.integer :other_id
      t.integer :book_id
      t.string :status

      t.timestamps
    end
  end
end
