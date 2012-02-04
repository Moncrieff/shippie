class Delivery < ActiveRecord::Base
  validates :name, :presence => true
  has_many :bids, :dependent => :delete_all
end
