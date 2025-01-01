Class {
	#name : 'MyPieceInitialState',
	#superclass : 'MyPieceState',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyPieceInitialState >> classicalMove [
	piece state: ((MyPieceMovingState new) piece: piece).
]

{ #category : 'as yet unclassified' }
MyPieceInitialState >> specialDoubleAdvanceMove [

	piece state: ((MyPawnDoubleAdvanceState new) piece: piece).
]