Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTests >> testFile [ 
	| pawn board |
	board := MyChessBoard empty.
	
	board at: 'e2' put: (pawn := MyPawn white).
	self assert: pawn square file equals: $2.
]

{ #category : 'tests' }
MyPawnTests >> testId [

	self assert: MyPawn new id equals: 'P'
]

{ #category : 'tests' }
MyPawnTests >> testMoves [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c3' put: (pawn := MyPawn white).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( c4 ) collect: [ :name |
				 board at: name ]).
			
	self 
		assert: squares size equals: 1.
]

{ #category : 'tests' }
MyPawnTests >> testMovesWithAllieObstacleDiagonal [
	| pawnW pawnB board |
	board := MyChessBoard empty.
	
	board at: 'e4' put: (pawnW := MyPawn white).
	board at: 'e5' put: MyPawn white.
	
	board at: 'b3' put: (pawnB := MyPawn black).
	board at: 'b2' put: MyPawn black.
	
	
	self assert: pawnW targetSquares isEmpty.
	self assert: pawnB targetSquares isEmpty.
	
]

{ #category : 'tests' }
MyPawnTests >> testMovesWithNoOpponents [ 
""" on vérifie que les pions noirs et blancs ne sont autorisés que à bouger d'une case vers l'avant"""
		| pawnW  pawnB squaresB squaresW board |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawnW := MyPawn white).
	board at: 'a3' put: (pawnB := MyPawn black).
	

	squaresW := pawnW targetSquares.
	squaresB := pawnB targetSquares.
	
	self assertCollection: squaresW includesAll: (#( e5 ) collect: [ :name | board at: name ]).
	self assertCollection: squaresB includesAll: (#( a2 ) collect: [ :name | board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testMovesWithOponentObstacleDiagonalWhenPawnBlack [
	| pawnB squares board |
	board := MyChessBoard empty.
	
	board at: 'e4' put: (pawnB := MyPawn black).
	board at: 'f3' put: MyPawn white.
	squares := pawnB targetSquares.
	self assertCollection: squares includesAll: (#( e3 f3 ) collect: [ :name | board at: name ]).
]

{ #category : 'tests' }
MyPawnTests >> testMovesWithOponentObstacleDiagonalWhenPawnWhite [
	| pawnW squares board |
	board := MyChessBoard empty.
	
	board at: 'e4' put: (pawnW := MyPawn white).
	board at: 'd5' put: MyPawn black.
	squares := pawnW targetSquares.
	self assertCollection: squares includesAll: (#( e5 d5 ) collect: [ :name | board at: name ]).
	


]
