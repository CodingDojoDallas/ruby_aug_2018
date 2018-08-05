class Blog < ActiveRecord::Base
    has_many :owners
    has_many :comments, as: :imageable
    has_many :users, through: :owners
    has_many :posts, :dependent => :delete_all
    validates :name, :description, presence: true, length: { in: 2..255 }
end
