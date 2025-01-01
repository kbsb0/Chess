Class {
	#name : 'MyPieceStateVisitor',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'visiting' }
MyPieceStateVisitor >> visitPieceDoubleAdvanceState: op piece: piece [

	self subclassResponsibility
]

{ #category : 'visiting' }
MyPieceStateVisitor >> visitPieceInitialState: op piece: piece [

	self subclassResponsibility
]

{ #category : 'visiting' }
MyPieceStateVisitor >> visitPieceMovingState: op piece: piece [

	self subclassResponsibility
]
