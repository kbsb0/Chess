Class {
	#name : 'MyKingTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyKingTest >> testIsCheckByOpponentsRook [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e1' put: MyRook black.

	self assert: king isInCheck
	
	
]

{ #category : 'tests' }
MyKingTest >> testIsNotCheckBySameColorRook [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an same color rook on e column"
	board at: 'e1' put: MyRook white.

	self deny: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testWhenIsCheckAndMoves [ [
    | king board whiteRook blackRook |
    board := MyChessBoard empty.
    board at: 'e4' put: (king := MyKing white).
    board at: 'b3' put: (whiteRook := MyRook white).
    board at: 'e1' put: (blackRook := MyRook black).

    self assert: king isInCheck.

    whiteRook moveTo: 'e3'.

    self assert: king isInCheck not.

    blackRook moveTo: 'h1'.

    self assert: king isInCheck not.

    whiteRook moveTo: 'e1'.

    self assert: king isInCheck not.

    board at: 'd2' put: (MyKnight black).

    self assert: king isInCheck.

    king moveTo: 'f4'.

    self assert: king isInCheck not.
]

	
	
	

	
	
]

{ #category : 'tests' }
MyKingTest >> testWhenKingIsThreatenedAndKingIsBlocked [

	| king board queen bishop aGame|
	board := MyChessBoard empty.
	aGame := MyChessGame freshGame .
	aGame board: board .	
	board at: 'e1' put: (king := MyKing white).
	board at: 'd1' put: (queen := MyQueen white).
	board at: 'd2' put: MyPawn white.
	board at: 'f1' put: (bishop := MyBishop white).	
	board at: 'f2' put: MyPawn white.	
	board at: 'e4' put: MyRook black.	
	self assert: king isInCheck.

	aGame protectKing:(king color).
	self deny: king isInCheck.
]

{ #category : 'tests' }
MyKingTest >> testWhenKingIsThreatenedByKnightAndAPawnCanCaptureIt [

	| king board pion aGame |
	board := MyChessBoard empty.
	aGame := MyChessGame freshGame .
	aGame board: board .	
	board at: 'e8' put: (king := MyKing black).
	board at: 'd8' put: MyQueen black.
	board at: 'd7' put: (pion := MyPawn black).
	board at: 'e7' put: MyPawn black.	
	board at: 'd6' put: MyKnight white.	
	self assert: king isInCheck.
	aGame protectKing:(king color).
	self deny: king isInCheck.
	
	
	
	
]

{ #category : 'tests' }
MyKingTest >> testWhenKingIsThreatenedByKnightAndKingCanMove [

	| king board aGame squares|
	board := MyChessBoard empty.
	aGame := MyChessGame freshGame .
	aGame board: board .	
	board at: 'e1' put: (king := MyKing white).
	board at: 'd3' put: MyKnight black.	
	self assert: king isInCheck.
	squares := king targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#(d1 d2 e2 f1) collect: [ :name |
				 board at: name ]).
	aGame protectKing:(king color).
	self deny: king isInCheck.
]
