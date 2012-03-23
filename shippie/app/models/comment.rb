class Comment < ActiveRecord::Base
  validates_presence_of :text
  belongs_to :delivery
  belongs_to :user
end
