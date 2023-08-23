"gst Account.st CheckingAccount.st SavingAccount.st Customer.st Bank.st"
Object subclass: Bank [
	| accounts |
	
	Bank class >> new [
		<category: 'instance creation'>
		| r |
		r := super new.
		r init.
		^r
    ]
    
    init [
    	<category: 'initialization'>
        accounts := Set new.
    ]
    
    add: account [
    	accounts add: account
    ]
    
    accrue: rate [
    	accounts do: [ :a | a accrue: rate ]
    ]
    
    printOn: stream [
        accounts do: [ :a | a printOn: stream . stream nextPutAll: (Character nl asString) ]
    ]
]

|bank c | 

bank := Bank new.
c := Customer new: 'Ann'.
bank add: (CheckingAccount new: '01001' cust: c bal: 100.00).
bank add: (SavingAccount new: '01002' cust: c bal: 200.00).
bank accrue: (0.02).
bank printNl !

	
	
