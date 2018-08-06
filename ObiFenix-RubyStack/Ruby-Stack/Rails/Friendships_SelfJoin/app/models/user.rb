class User < ActiveRecord::Base
	has_many :friendships, foreign_key: :user_id, class_name: 'Friendship', :dependent => :destroy
	has_many :friending, through: :friendships, source: :friend

	has_many :friended, foreign_key: :friend_id, class_name: 'Friendship', :dependent => :destroy
	has_many :friended_by, through: :friended, source: :user
end
