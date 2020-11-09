class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :aouther
      t.integer :pagecount

      t.timestamps
    end
  end
end
