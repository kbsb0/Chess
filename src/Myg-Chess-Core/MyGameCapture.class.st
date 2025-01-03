Class {
	#name : 'MyGameCapture',
	#superclass : 'MyGameMove',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'public' }
MyGameCapture >> handleRequest: aPlayer [

	| king threateningPieces toCapture playerGame |
	king := self setKing: aPlayer.
	threateningPieces := self threateningPieces: aPlayer for: king.
	playerGame := self setGame: aPlayer.

	threateningPieces ifNotEmpty: [ "on recherche une pièce pour capturer une menace"
		toCapture := threateningPieces
			             detect: [ :threat |
				             aPlayer pieces anySatisfy: [ :piece |
					             piece legalTargetSquares includes: threat square ] ]
			             ifNone: [ nil ].

		toCapture ifNotNil: [
			| pieceToMove |
			pieceToMove := aPlayer pieces detect: [ :piece |
				               piece legalTargetSquares includes: toCapture square ].
			playerGame move: pieceToMove to: toCapture square.
			^ true ] ].
	^ false
]

{ #category : 'as yet unclassified' }
MyGameCapture >> threateningPieces: aPlayer for: aKing [

	^ aPlayer threateningPieces: aKing
]
