class Person
    attr_accessor :name, :cash, :account
    def initialize(attrs ={})
        @name ={}
        @cash = 0
        @account = nil
        set_name(attrs[:name])
    end

    def set_name(name)
        name == nil ? missing_name : name
    end

    def missing_name
        raise 'A name is required'
    end

    def create_account
        @account = Account.new(owner: self)
    end

    def deposit(amount)
        @account == nil ? missing_account : deposit_funds(amount)
    end

    def missing_account
        raise RuntimeError, 'No account present'
    end

    def deposit_funds(amount)
        @cash -= amount
        @account.balance += amount
    end

end