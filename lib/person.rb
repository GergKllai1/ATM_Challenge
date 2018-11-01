require './lib/account.rb'
require './lib/atm.rb'

class Person
    attr_accessor :name, :cash, :account, :job
    def initialize(attrs ={})
        @name ={}
        @cash = 0
        @account = nil
        @job = {}
        set_name(attrs[:name])
    end

    def set_name(name)
        name == nil ? missing_name : @name = name
    end

    def missing_name
        raise 'A name is required'
    end

    def create_account
        @job == {} ? create_account_error : @account = Account.new(owner: self)
    end

    def create_account_error
        raise RuntimeError, 'You cannot create an account at us without a job sorry'
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

    def withdraw(args = {})
        @account == nil ? missing_account : withdraw_funds(args)
    end

    def withdraw_funds(args)
        args[:atm] == nil ? missing_atm : atm = args[:atm]
        account = @account
        amount = args[:amount]
        pin = args[:pin]
        response = atm.withdraw(amount, pin, account)
        response[:status] == true ? increase_cash(response) : response
    end

    def increase_cash(response)
        @cash += response[:amount]
    end

    def missing_atm
        raise RuntimeError, 'An ATM is required'
    end

    def getting_a_job(position,hourly_wage)
        @job = {position: position, hourly_wage: hourly_wage}        
    end

    def working(hours)
        @cash += @job[:hourly_wage] * hours
    end
end