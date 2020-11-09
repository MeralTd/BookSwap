class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.integer :trade_status, default: 0
    
      t.timestamps
    end
  end
end
