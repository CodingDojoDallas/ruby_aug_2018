# ========================
# Assignment: Bank Account
# ========================
#
# => Objective:
#    <>  Create a BankAccount class that emulate some of the common account transactions...
#         o  shall display your account number (checking, savings, and total amount).
#            shall have methods to invoke activities such as depositing a check, checking your balance, withdrawing money
# ==================================================

class BankAccount

    @@n_accounts = 0

    attr_reader :checking, :savings
    private_class_method :initialize

    def initilize
        @bankaccount_n = account_number
        @checking      = 1205.10
        @savings       = 255.02
        @interestrate  = 0.01
        @@n_accounts  += 1
        # ====================================== [ Initial Report ]
        puts "Welcome to JTFenixBank!"
        puts "Your jtf-account has been created"
        puts @@bankaccount_n
        puts "Current Number of accounts: #{@@n_accounts}"
        # ======================================
    end

    def deposit amount, acc_type="checking"
        puts "I am in deposit"
        acc_type == "checking" ?
            @checking += amount (puts "You've successfuly deposited $#{amount} to your #{acc_type}. Your current balance is $#{@checking}") :
            @savings += amount (puts "You've successfuly deposited $#{amount} to your #{acc_type}. Your current balance is $#{@checking}")
        self
    end

    def withdraw amount, acc_type="checking"
        puts "I am in widthdraw"
        acc_type == "checking" ?
            (@checkings >= amount) ? @checking -= amount :  (puts "Your #{acc_type} account do not have suficient funds for this withdraw") :
            (@savings >= amount) ? @savings -= amount : (puts "Your #{acc_type} account do not have suficient funds for this withdraw")
        self
    end

    def accountinfo
    private
    def account_number
        rand(7**9)
    end
end



client = BankAccount.new
# client.accountinfo
puts client.deposit(122)
puts client.widthdraw(10)
puts client.savings
# user_account.de



