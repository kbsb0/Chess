Class {
	#name : 'MyPawnDoubleAdvanceState',
	#superclass : 'MyPieceState',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'visiting' }
MyPawnDoubleAdvanceState >> accept: visitor [
	^ visitor visitPieceDoubleAdvanceState: piece.

]

{ #category : 'as yet unclassified' }
MyPawnDoubleAdvanceState >> classicalMove [
	piece state: ((MyPieceMovingState new) piece: piece). 
]

{ #category : 'as yet unclassified' }
MyPawnDoubleAdvanceState >> specialDoubleAdvanceMove [
	self
]
