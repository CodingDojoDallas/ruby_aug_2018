class User < ActiveRecord::Base
    has_many :friend, foreign_key: :user_id, class_name: "Friendship"
    has_many :friends, through: :friend, source: :friendship

    has_many :friended, foreign_key: :friendship_id, class_name: "Friendship"
    has_many :friended_by, through: :friended, source: :user 
end
