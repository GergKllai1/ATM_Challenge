class Account
    require 'date'
    attr_accessor :pin_code, :balance, :account_status, :exp_date, :owner
    STANDARD_VALIDITY_YRS = 5

    def initialize(attrs = {})
        @pin_code = create_pin_code
        @balance = 0
        @account_status = :active
        @exp_date = set_expire_date
        @owner = {}
        set_owner(attrs[:owner])
    end

    def set_owner(obj)
        obj == nil ? missing_owner : @owner = obj
    end

    def missing_owner
        raise "An Account owner is required"
    end

    def set_expire_date
        Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end

    def deactivate
        @account_status = :disabled
    end

    def create_pin_code
        @pin_code = rand(1000..9999)
    end
end