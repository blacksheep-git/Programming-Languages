Object subclass: Customer [
	<comment: 'I am Buffs Customer class'>
		| name |
		
	Customer class >> new: nameIn [
		<category: 'instance creation'>
		| r |
		r := super new.
		r init: nameIn.
		^r
    ]
    
    init: nameIn [
    	<category: 'initialization'>
        name := nameIn
    ]
    
	printOn: stream [
		stream nextPutAll: name
	]
]

