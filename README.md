# ATM Simulator Instruction manual
##### Created by Hanna and Greg

## How to use this simulator

1. You have to invoke person.rb in IRB with the command:
```irb -r ./lib/person.rb ```

2. You have to create a new person class with your name:
```hanna = Person.new(name:'Hanna Linnea Nyman')  => #<Person:0x00007f840f8b5390 @name="Hanna Linnea Nyman", @cash=0, @account=nil, @job={}> ```

3. You have to get a job:
``` hanna.getting_a_job("Junior Developer", 25) => {:position=>"Junior Developer", :hourly_wage=>25}```

4. You can create an account only if you have a job:
``` hanna.create_account => #<Account:0x00007f840f8ad348 @pin_code=2291, @balance=0, @account_status=:active, @exp_date="11/23", @owner=#<Person:0x00007f840f8b5390 @name="Hanna Linnea Nyman", @cash=0, @account=#<Account:0x00007f840f8ad348 ...>, @job={:position=>"Junior Developer", :hourly_wage=>25}>> ```

5. You can only deposit money if you have cash. You can only get cash if you work some hours:
``` hanna.working(40) => 1000```

6. If you have cash you can deposit it in your account. You cannot deposit more than you have:
```hanna.deposit(500) => 500 ```

7. In order to withdraw your money you first have to create an ATM:
``` bankautomat = Atm.new => #<Atm:0x00007f840f8acba0 @funds=1000>```

8. In order to not get error message, you have to know your pin code:
```hanna.account.pin_code => 2291 ```

9. With that information you can withdraw money from the ATM. You need the ATM name, the amount and your pin:
```hanna.withdraw(atm:bankautomat, amount:350, pin:2291) => 850 ```

## DISCLAMERS

* You need to have a job to create an account
* You need to work to have cash to deposit. If you want to deposit more cash than you have it will be unsuccessful and you recieve an error message
* If your account is inactive, the ATM has unsufficient funds, you are using wrong pin or withdraw more than your balance the withdrawal will be unsuccessful and you will recieve an error message
* The money you withdrawn will increase your cash
