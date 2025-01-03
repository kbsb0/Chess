Class {
	#name : 'MyPieceMoveStrategyTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPieceMoveStrategyTests >> testRetrunCorrectSquare [

	| pawnW pawnB board |
	board := MyChessBoard empty.
	board at: 'c3' put: (pawnW := MyPawn white).
	board at: 'd3' put: (pawnB := MyPawn black).


	self
		assert: (MyPieceMoveStrategyUp new nextSquare: pawnW square)
		equals: (board at: 'c4').
		
	self
		assert: (MyPieceMoveStrategyDown new nextSquare: pawnW square)
		equals: (board at: 'c2').
]
