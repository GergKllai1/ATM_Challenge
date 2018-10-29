class Atm
    attr_accessor :funds
    require 'date'
    
    def initialize
        @funds = 1000
    end

    def withdraw(amount, account)
        case
        when insufficient_funds_in_acccount?(amount,account)
            return
        else
          perform_transaction(amount,account)
        end
      end

      def insufficient_funds_in_acccount?(amount,account)
        amount > account.balance
      end

      def perform_transaction(amount,account)
        @funds -= amount
        account.balance = account.balance - amount
        { status: true, message: 'success', date: Date.today, amount: amount }
      end
end