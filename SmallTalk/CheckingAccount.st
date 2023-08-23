Account subclass: CheckingAccount [

	CheckingAccount class >> new:  numberIn cust: customerIn bal: balanceIn  [
		| r |
		<category: 'instance creation'>
		r := super new.
		r init: numberIn cust: customerIn bal: balanceIn.
		^r
    ]
	
	init: numberIn cust: customerIn bal: balanceIn [
		<category: 'initialization'>
		balance := balanceIn.
		customer := customerIn.
		number := numberIn
	]
	
	accrue: rate []
]
