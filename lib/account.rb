class Account
    STANDARD_VALIDITY_YRS = 5
    attr_accessor :pin_code, :balance, :account_status, :exp_date, :account_name

    def initialize()
        @pin_code = rand(1000..9999)
        @balance = []
        @account_status = []
        @exp_date = set_expire_date
        @account_name = {}
    end

    def set_expire_date
        Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end
end