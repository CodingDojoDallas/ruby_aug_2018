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
        @bankaccount_no = no_generator
        @checking       = 100
        @savings        = 200
        @interestrate   = 0.01
        @@n_accounts   += 2
        display_newaccountinfo
    end

    def deposit amount, account="checking"
        account == "checking" ?
            @checking += amount (puts "You've successfuly deposited $#{amount} to your #{account}. Your current balance is $#{@checking}") :
            @savings += amount (puts "You've successfuly deposited $#{amount} to your #{account}. Your current balance is $#{@checking}")
        self
    end

    def withdraw amount, account="checking"
        account == "checking" ?
            (@checkings >= amount) ? @checking -= amount :  (puts "Your #{account} account do not have suficient funds for this withdraw") :
            (@savings >= amount) ? @savings -= amount : (puts "Your #{account} account do not have suficient funds for this withdraw")
        self
    end

    def display_newaccountinfo
        puts "======================================= [ Account Info ]"
        puts "Welcome to JTFenixBank!"
        puts "Your jtf-account has been created                       "
        puts "--------------------------------------------------------"
        puts "Your Account Number:              #{@@bankaccounts}.    "
        puts "Total Numbet of Active Accounts:  #{@@accounts}.        "
        puts "Interest Rate:                    #{@interest}.         "
        puts "--------------------------------------------------------"
        puts "Checking Account Balance:         $#{@checking}.        "
        puts "Savings  Account Balance:         $#{@savings}          "
        puts "Total Account Balance:            $#{@total}.           "
        puts "========================================================"
    end

    def display_accountinfo
        puts "======================================= [ Account Info ]"
        puts "                                                        "
        puts "Account Number:                   #{@@bankaccounts}     "
        puts "Number of Active Accounts at JTF: #{@@accounts}.        "
        puts "Interest Rate:                    #{@interest}.         "
        puts "Checking Account Balance:         $#{@checking}.        "
        puts "Savings  Account Balance:         $#{@savings}          "
        puts "Total Account Balance:            $#{@total}.           "
        puts "                                                        "
        puts "========================================================"
    end

    private
    def no_generator
        rand(7**9)
    end

    def no_of_accounts
        puts "#{@@n_accounts}"
        self
    end

    def check_accoutbalance account="checking"
        account == "checking" ?
            (puts "You currently have a balance of $#{@checking} in your #{account}") :
            (puts "You currently have a balance of $#{@savings} in your #{account}")
        self
    end

    def totalbalance
        @total = @saving_balance + @checking_balance
        self
    end
end

BankAccount1 = BankAccount.new.withdraw(1000, 'saving').checking.savings.total.account_information