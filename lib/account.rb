class Account
    attr_accessor :pin_code, :balance, :account_status, :exp_date, :account_name

    def initialize()
        @pin_code = rand(1000..9999)
        @balance = []
        @account_status = []
        @exp_date = []
        @account_name = {}
    end
end