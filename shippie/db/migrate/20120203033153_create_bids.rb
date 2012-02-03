class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :price
      t.references :delivery

      t.timestamps
    end
    add_index :bids, :delivery_id
  end
end
