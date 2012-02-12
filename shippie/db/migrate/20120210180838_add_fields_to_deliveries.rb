class AddFieldsToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :weight, :decimal
    add_column :deliveries, :height, :decimal
    add_column :deliveries, :length, :decimal
    add_column :deliveries, :wideness, :decimal
    add_column :deliveries, :from_city, :string
    add_column :deliveries, :from_address, :string
    add_column :deliveries, :to_city, :string
    add_column :deliveries, :to_address, :string
    add_column :deliveries, :date, :date
    add_column :deliveries, :description, :text
  end
end
