Object subclass: Account [
	| number customer balance |
	
	<comment: 'I am Buffs abstract Account class'>
	Account class >> new [
		<category: 'instance creation'>
		| r |
		r := super new.
		^r
    ]
    
    accrue: rate [
		^self subclassResponsibility
	]
		
	balance [
		^balance
	]
    
    deposit: amountIn [
    	balance := balance + amountIn
    ]
    
    withdraw: amountOut [
    	balance := balance - amountOut
    ]

    printOn: stream [
        <category: 'printing'>
        stream nextPutAll: number.
        stream nextPutAll: ' : '.
        customer printOn: stream.
        stream nextPutAll: ' : '.
        balance printOn: stream
    ]
]
