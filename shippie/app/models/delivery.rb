class Delivery < ActiveRecord::Base
  validates :name, :presence => true
end
