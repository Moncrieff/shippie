class Delivery < ActiveRecord::Base
  validates :name, :presence => true
  has_many :bids
end
