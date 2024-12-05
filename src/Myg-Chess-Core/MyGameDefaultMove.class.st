Class {
	#name : 'MyGameDefaultMove',
	#superclass : 'MyGameMove',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'public' }
MyGameDefaultMove >> handleRequest: aPlayer [

	| pieces piece legalMoves |
	pieces := aPlayer pieces.
	[ pieces notEmpty ] whileTrue: [
		piece := pieces atRandom.
		legalMoves := piece legalTargetSquares.
		legalMoves ifNotEmpty: [
			aPlayer game move: piece to: legalMoves atRandom.
			^ true ]
		"pieces remove: piece." ].
	^ false
]
