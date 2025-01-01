Class {
	#name : 'MyPieceMovingState',
	#superclass : 'MyPieceState',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyPieceMovingState >> classicalMove [
	self
]

{ #category : 'as yet unclassified' }
MyPieceMovingState >> specialDoubleAdvanceMove [
	piece state: ((MyPawnDoubleAdvanceState new) piece: piece).
]
