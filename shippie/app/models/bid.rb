class Bid < ActiveRecord::Base
  validates :price, :presence => true,
    :numericality => true
  belongs_to :delivery
  belongs_to :user
end
