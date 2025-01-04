Class {
	#name : 'MyChessColorBlack',
	#superclass : 'MyChessColor',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyChessColorBlack >> createPiece: pieceClass [
	^ pieceClass black.
]

{ #category : 'initialization' }
MyChessColorBlack >> initialize [
	color := Color black.
]
