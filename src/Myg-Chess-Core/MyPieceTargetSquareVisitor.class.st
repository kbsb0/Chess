Class {
	#name : 'MyPieceTargetSquareVisitor',
	#superclass : 'MyPieceStateVisitor',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'visiting' }
MyPieceTargetSquareVisitor >> visitPieceDoubleAdvanceState: piece [

	strategy = 'moveEnPassant' ifTrue: [
		(piece oppositeMoveStrategy nextSquare: (piece square)) enPassantTarget: true.
		^ piece oppositeMoveStrategy nextSquare: (piece square).
		 ].
	^ nil
]

{ #category : 'visiting' }
MyPieceTargetSquareVisitor >> visitPieceInitialState: piece [
|square|
	strategy = 'moveDouble' ifTrue: [
		square := piece square.
		^ piece moveStrategy nextSquare: (piece moveStrategy nextSquare: square).
			 ].
	^ nil
]

{ #category : 'visiting' }
MyPieceTargetSquareVisitor >> visitPieceMovingState: piece [
	^ nil
]
