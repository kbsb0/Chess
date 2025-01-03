Class {
	#name : 'MyPieceTargetSquareVisitor',
	#superclass : 'MyPieceStateVisitor',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'visiting' }
MyPieceTargetSquareVisitor >> visitPieceDoubleAdvanceState: piece [

	strategy = 'moveEnPassant' ifTrue: [
		piece isWhite
			ifTrue: [ piece  square down enPassantTarget: true. ^ piece square down ]
			ifFalse: [ piece  square up enPassantTarget: true. ^ piece square up ] ].
	^ nil
]

{ #category : 'visiting' }
MyPieceTargetSquareVisitor >> visitPieceInitialState: piece [

	strategy = 'moveDouble' ifTrue: [
		^ piece isWhite
			  ifTrue: [ piece square up up ]
			  ifFalse: [ piece square down down ] ].
	^ nil
]

{ #category : 'visiting' }
MyPieceTargetSquareVisitor >> visitPieceMovingState: piece [
	^ nil
]
