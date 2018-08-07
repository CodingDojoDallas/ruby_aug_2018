class User < ActiveRecord::Base
    # validates :first_name, :last_name, :email, presence: true, length: { in: 2..20 } # length: { minimum: 2}
    # validates_numericality_of :age, less_than: 150, greater_than_or_equal_to:10, message:"this is not a number"
    # validates :age, presence:true || OR
    # validates :age, numericality: {only_integer:true, greater_than_or_equal_to:10, less_than:150}, presence:true
    

    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, presence: true, length: { in: 2..20 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    
    # creating a custom instance method. self refers to the ActiveRecord object
    def full_name
        "#{self.first_name} #{self.last_name}"
    end
  
    # creating a custom class method. self refers to the User model
    def self.average_age
        self.sum(:age) / self.count
    end

    # this callback will run before saving on create and update
    before_save :downcase_email
    
    # this callback will run after creating a new user
    after_create :successfully_created
    
    # this callback will run after updating an existing user
    after_update :successfully_updated
    
    # this callback will only run on creating a record to ensure a default age of 0
    before_validation :default_age, on: [:create]
    
    private
      def downcase_email
        self.email.downcase!
      end
      
      def successfully_created
        puts "Successfully created a new user"
      end
      def successfully_updated
        puts "Successfully updated a existing user"
      end
      
      def default_age
        self.age = 0 unless self.age?
      end
  end