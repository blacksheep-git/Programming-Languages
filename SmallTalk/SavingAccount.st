Account subclass: SavingAccount [
	| interest |
	
	SavingAccount class >> new: numberIn cust: customerIn bal: balanceIn [
		| r |
		<category: 'instance creation'>
		r := super new.
		r init: numberIn cust: customerIn bal: balanceIn.
		^r
    ]
	
	init: numberIn cust: customerIn bal: balanceIn [
		<category: 'initialization'>
		interest:= 0.
		balance := balanceIn.
		customer := customerIn.
		number := numberIn
	]
	
	accrue: rate [
		interest := interest + (balance*rate).
		balance := balance + (balance*rate)
	]
]
