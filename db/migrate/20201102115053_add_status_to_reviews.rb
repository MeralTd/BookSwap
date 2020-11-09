class AddStatusToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :status, :string
  end
end
