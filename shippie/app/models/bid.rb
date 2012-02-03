class Bid < ActiveRecord::Base
  validates :price, :presence => true,
    :numericality => true
  belongs_to :delivery
end
