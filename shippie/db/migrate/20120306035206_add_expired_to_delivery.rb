class AddExpiredToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :expired, :boolean, :default => false
  end
end
