class BankAccount
	@@no_of_accounts = 0
  def initialize checking_balance = 100, saving_balance = 200
    generate
  	@checking_balance = checking_balance
  	@saving_balance = saving_balance
  	@total = total
  	@@no_of_accounts += 2
  	@interest = 0.01
  end

  def displayaccounts
  	puts "#{@@no_of_accounts}"
  	self
  end
	
  def account_information
  	puts "#{@account_number} #{@checking_balance} #{@saving_balance} #{@total} #{@interest}"
  	self
  end

  def checkingbalance
  	puts "Checking Balance: #{@checking_balance}"
  	self
  end

  def savingbalance
  	puts "Saving Balance: #{@saving_balance}"
  	self
  end

  def deposit money, account
  	if account == 'saving'
  		@saving_balance += money
  	elsif account == 'checking'
  		@checking_balance += money
  	else
  		puts "Deposit Invalid!"
  	end
  	self
  end

   def withdraw money, account
  	if account == 'saving' && @saving_balance > money
  		@saving_balance -= money
  	elsif account == 'checking' && @checking_balance > money
  		@checking_balance -= money
  	else puts "Withdrawal Invalid!"
  	end
  	self
   end

   def total
   	@total = @saving_balance + @checking_balance
   	puts "Here is your grand total: #{@total}"
   	self
   end

  private
  	def generate
  		y = Array.new
  		10.times {y.push(rand(0..9))}
  		y = y.join.to_i
  		@account_number = y
  		self
  	end
end

BankAccount1 = BankAccount.new.withdraw(1000, 'saving').checkingbalance.savingbalance.total.displayaccounts.account_information
