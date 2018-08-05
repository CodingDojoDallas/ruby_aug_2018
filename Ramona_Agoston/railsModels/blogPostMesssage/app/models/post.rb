class Post < ActiveRecord::Base
    belongs_to :blog, required: true, dependent: :destroy
    belongs_to :user, required: true, dependent: :destroy
    has_many :messages

    validates :title, :content, presence: true
    validates :title, length: { minimum: 5 }
    validates :content, length: { minimum: 10 }
end
