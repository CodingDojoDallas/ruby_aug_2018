class Blog < ActiveRecord::Base
  has_many :blogs, dependent: :destroy
  validates :name, :desc, presence: true
end
