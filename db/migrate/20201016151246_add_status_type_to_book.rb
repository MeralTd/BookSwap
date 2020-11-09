class AddStatusTypeToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :status_type, :string
  end
end
