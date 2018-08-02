class BankAccount
    @@number_of_accounts = 0

    def initialize
        @account_num = acc_num
        @checking_account = 0
        @savings_account = 0
        @intrest_rate = 0.01
        @@number_of_accounts += 1
        puts "This bank has #{@@number_of_accounts} accounts."
        self
    end

    def show_acc_num
        puts "Your account number is #{@account_num}"
        self
    end

    def checking_balance
        puts "Your current checking account balance is #{@checking_account}"
        self
    end

    def savings_balance
        puts "Your current savings account balance is #{@savings_account}"
        self
    end

    def deposit acc='checking', num
        acc == 'checking' ? @checking_account += num : @savings_account += num
        self
    end
    
    def withdraw acc='checking', num
        acc == 'checking' ? 
            @checking_account>num ? @checking_account -= num : (puts 'Insufficient funds') : 
            @savings_account>num ? @savings_account -= num : (puts 'Insufficient funds')
        self
    end

    def total
        puts "Total amount in your account is #{@checking_account + @savings_account}"
        self
    end

    def account_information
        show_acc_num
        total
        checking_balance
        savings_balance
        puts "Your intrest rate is #{@intrest_rate}"
    end

    private
        def acc_num
            rand(10000..99999)
        end
end

user1 = BankAccount.new.deposit(200).withdraw(30).account_information
puts
user2 = BankAccount.new.deposit('savings', 100).withdraw('savings',200).account_information