Class {
	#name : 'MyChessColorWhite',
	#superclass : 'MyChessColor',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyChessColorWhite >> createPiece: pieceClass [

	^ pieceClass white.
]

{ #category : 'initialization' }
MyChessColorWhite >> initialize [

	color := Color white
]
