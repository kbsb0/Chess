Class {
	#name : 'MyPieceTargetSquareVisitor',
	#superclass : 'MyPieceStateVisitor',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'visiting' }
MyPieceTargetSquareVisitor >> visitPieceDoubleAdvanceState: op piece: piece [

	op = 'classic' ifTrue: [ ^ piece square ].
	op = 'enPassant' ifTrue: [
		piece isWhite
			ifTrue: [ ^ piece square up ]
			ifFalse: [ ^ piece square down ] ].
	^ nil.
]

{ #category : 'visiting' }
MyPieceTargetSquareVisitor >> visitPieceInitialState: op piece: piece [
	^ piece square 
]

{ #category : 'visiting' }
MyPieceTargetSquareVisitor >> visitPieceMovingState: op piece: piece [

		^ piece square
]
