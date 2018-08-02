class Test < ActiveRecord::Base
  has_and_belongs_to_many :other_tests
end
