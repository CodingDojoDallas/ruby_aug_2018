class Dojo < ActiveRecord::Base
  has_many :ninjas, :dependent => :destroy
  # has_many  :ninjas, dependent: :destroy
  validates :name, :city, :state, presence: true
  validates :state, length: { is: 2 }, numericality: false
end