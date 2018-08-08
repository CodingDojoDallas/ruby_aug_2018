class User < ActiveRecord::Base
    has_many  :follower,  foreign_key: :follower_id, class_name: "Follow"
    has_many  :following, through: :follower, source: :followee

    has_many  :followed, foreign_key: :followee_id, class_name: "Follow"
    has_many  :followed_by, through: :followed, source: :follower
end
