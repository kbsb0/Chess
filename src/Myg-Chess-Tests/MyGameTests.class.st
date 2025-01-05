Class {
	#name : 'MyGameTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyGameTests >> testMoveTo [

	| game board actualSquare targetSquare piece |
	game := MyChessGame freshGame.
	board := game children at: 1.
	actualSquare := board at: 'a2'.
	targetSquare := board at: 'a3'.

	piece := MyPawn white.
	board at: 'a2' put: piece.


	self assert: actualSquare contents equals: piece.
	game move: piece to: targetSquare.
	self assert: actualSquare contents equals: nil.
	self assert: targetSquare contents equals: piece.
]

{ #category : 'tests' }
MyGameTests >> testWhenIsNotAMoveOfTheCurrentPlayer [

	| game board square piece res|
	game := MyChessGame freshGame.
	board := game children at: 1.
	square := board at: 'a2'.
	piece := MyPawn black.
	board at: 'a2' put: piece.
	self assert: game currentPlayer color equals: Color white.
	res := game move: piece to: (board at: 'c4').
	self assert: piece square equals: square.
	self assert: game equals: res.
	
	
]
