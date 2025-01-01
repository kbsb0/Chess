Class {
	#name : 'MyPieceStateVisitor',
	#superclass : 'Object',
	#instVars : [
		'strategy'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPieceStateVisitor >> strategy [

	^ strategy.
]

{ #category : 'accessing' }
MyPieceStateVisitor >> strategy: s [
	strategy := s.
]

{ #category : 'visiting' }
MyPieceStateVisitor >> visitPieceDoubleAdvanceState: piece [

	self subclassResponsibility
]

{ #category : 'visiting' }
MyPieceStateVisitor >> visitPieceInitialState: piece [

	self subclassResponsibility
]

{ #category : 'visiting' }
MyPieceStateVisitor >> visitPieceMovingState:  piece [

	self subclassResponsibility
]
