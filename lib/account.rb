class Account
    attr_accessor

    def initialize(pin_code, balance, account_status, exp_date)
        @pin_code = pin_code
        @balance = balance
        @account_status = account_status
        @exp_date = exp_date
        @account_name = {}
    end
end