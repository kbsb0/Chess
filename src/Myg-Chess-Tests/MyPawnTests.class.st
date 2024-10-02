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
MyPawnTests >> testMoveTo [ 
	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c3' put: (pawn := MyPawn white).
	
	squares := pawn targetSquares.
	
	"mon pion est positioné en c3"
	self assert: (pawn square) equals: (board at: 'c3').
	
	
	
	"après déplacement, mon pion est positioné en c4"
	 board at: 'c4' put: (pawn := MyPawn white).
	self assert: (pawn square) equals: (board at: 'c4').
	
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
MyPawnTests >> testMovesWithBlackPawnWhenCanPriseEnPassant [

	| pawnW pawnB board squaresB |
	board := MyChessBoard empty.

	"On place un pion noir sur la 4eme ligne"
	board at: 'e4' put: (pawnB := MyPawn black).

	"On place un pion blanc qui avance de 2 cases"
	board at: 'f2' put: (pawnW := MyPawn white).
	pawnW moveTo: (board at: 'f4').

	
	"On vérifie que le pion noir peut manger le blanc ( prise en passant )"
	squaresB := pawnB targetSquares.
	
	
	self
		assertCollection: squaresB
		includesAll: (#(  e3 f4 ) collect: [ :name | board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testMovesWithBlackPawnWhenStart [
	| pawn  board squares |
	board := MyChessBoard empty.
	
	board at: 'e7' put: (pawn := MyPawn black).
	
	squares := pawn targetSquares.
	self assertCollection: squares includesAll: (#( e6 e5 ) collect: [ :name | board at: name ]).
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

{ #category : 'tests' }
MyPawnTests >> testMovesWithWhitePawnWhenCanPriseEnPassant [

	| pawnW pawnB board squaresW |
	board := MyChessBoard empty.

	"On place un pion blanc sur la 5eme ligne"
	board at: 'e5' put: (pawnW := MyPawn white).

	"On place un pion noir qui avance de 2 cases"
	board at: 'f7' put: (pawnB := MyPawn black).
	pawnB moveTo: (board at: 'f5').


	"On vérifie que le pion blanc peut manger le noir ( prise en passant )"
	squaresW := pawnW targetSquares.
	self
		assertCollection: squaresW
		includesAll: (#( e6 f5 ) collect: [ :name | board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testMovesWithWhitePawnWhenStart [
	| pawn  board squares |
	board := MyChessBoard empty.
	
	board at: 'e2' put: (pawn := MyPawn white).
	
	squares := pawn targetSquares.
	self assertCollection: squares includesAll: (#( e3 e4 ) collect: [ :name | board at: name ]).
]
