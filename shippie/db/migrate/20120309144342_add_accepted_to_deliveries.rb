class AddAcceptedToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :accepted, :boolean
  end
end
