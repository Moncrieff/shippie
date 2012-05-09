class AddCategoryToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :category, :string
  end
end
