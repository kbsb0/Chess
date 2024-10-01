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
    board updateAttaques.
    self assert: king isInCheck not.

    blackRook moveTo: 'h1'.
    board updateAttaques.
    self assert: king isInCheck not.

    whiteRook moveTo: 'e1'.
    board updateAttaques.
    self assert: king isInCheck not.

    board at: 'd2' put: (MyKnight black).
    board updateAttaques.
    self assert: king isInCheck.

    king moveTo: 'f4'.
    board updateAttaques.
    self assert: king isInCheck not.
]

	
	
	

	
	
]
