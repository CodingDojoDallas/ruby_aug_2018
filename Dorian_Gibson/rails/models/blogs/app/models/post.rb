class Post < ActiveRecord::Base
    belongs_to :blog
    belongs_to :user
    has_many :messages, :dependent => :delete_all
    validates :title, presence: true, length: { in: 7..300 }
    validates :content, presence: true, length: { in: 2..255 }

end
