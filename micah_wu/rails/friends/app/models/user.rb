class User < ActiveRecord::Base
    has_many :user, foreign_key: :user_id, class_name: "Friendship"
    has_many :friendships, through: :user, source: :friend_id

    has_many :friendship, foreign_key: :friend_id, class_name: "Friendship"
    has_many :users, through: :friend, source: :user_id
end
