class Blog < ActiveRecord::Base
    has_many :posts, dependent: :destroy
    validates :name, :description, presence: true
end
