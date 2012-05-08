class Delivery < ActiveRecord::Base
  validates :name, :presence => true
  validates :from_city, :presence => true
  validates :from_address, :presence => true
  validates :to_city, :presence => true
  validates :to_address, :presence => true
  validates :category, :presence => true
  has_many :bids, :dependent => :delete_all

  CATEGORIES = %w[furniture electronics other]
end
