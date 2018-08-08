class Messsage < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :comments, as: :imageable  # Polymorphic Relationship
end
