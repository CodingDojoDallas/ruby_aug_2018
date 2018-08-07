class BankAccount
    @@number_of_accounts = 0

    private_class_method :initialize
    #http://codebeerstartups.com/2016/07/private-class-methods-in-ruby/

#view balance with attr_reader/(getter) method
    attr_reader :checkbalance, :savingsbalance

    def initialize
        @accountnumber = return_account_number
        @checkbalance = 1205.10
        @savingsbalance = 255.02
        @interest_rate = 0.01
        @@number_of_accounts += 1
        puts "A new account has been created."
        puts @accountnumber
    end

    def depositchecking val
        @checkbalance += val
        puts "You deposited $#{val}, and checking account balance is $#{@checkbalance}."
        self
    end

    def depositsavings val
        @savingsbalance += val
        puts "Savings account balance +#{@savingsbalance}."
        self
    end

    def withdrawsavings val
        if @savingsbalance >= val then @savingsbalance -= val 
        else puts "You have insufficient funds for this withdrawal."
        end
        self
    end

    def withdrawchecking val
        if @checkbalance >= val then @checkbalance -= val 
        else puts "You have insufficient funds for this withdrawal."
        end
        self
    end

    def view_number_of_accounts
        puts "Total number of accounts at bank is #{@@number_of_accounts}."
        self
    end

    def totalbalance
        @total = @checkbalance + @savingsbalance
        p "Your account totals are $#{@total}"
        self
    end

    def account_information
        puts "Account number is #{@accountnumber}."
        puts "Total funds in our bank is #{@checkbalance + @savingsbalance}."
        puts "Checking account balance is #{@checkingbalance}."
        puts "Savings account balance is #{@savingsbalance}."
        puts "Your interest rate is #{@interest_rate}."
        self
    end

    private
    def return_account_number
        rand(7**9)
    end

    
end

account1 = BankAccount.new
puts account1.checkbalance
puts account1.savingsbalance
account1.depositchecking 100
account1.withdrawchecking 1500
puts account1.checkbalance
account2 = BankAccount.new
account3 = BankAccount.new
p account1.totalbalance