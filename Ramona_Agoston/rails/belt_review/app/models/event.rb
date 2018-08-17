class Event < ActiveRecord::Base
    validates :name, :date, :city, :state, presence: true
    validates_each :date, allow_nil:true do |record, attr, value|
        record.errors.add(attr, 'must be in the future') if value < Date.today
    end
    belongs_to :user
    has_many :joins, dependent: :destroy
    has_many :users, through: :joins, source: :user
    has_many :comments, dependent: :destroy
end
