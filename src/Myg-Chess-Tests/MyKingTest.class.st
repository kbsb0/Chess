Class {
	#name : 'MyKingTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyKingTest >> testIsChechMatedWhenItSFalse [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	| king board |
	board := MyChessBoard empty.
	board at: 'e8' put: (king := MyKing white).
	
	board at: 'd6' put: (MyQueen black ).
	
	self deny: king isCheckMated.
	
	
	
]

{ #category : 'tests' }
MyKingTest >> testIsChechMatedWhenItSTrue [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	| king board |
	board := MyChessBoard empty.
	board at: 'e8' put: (king := MyKing white).
	
	board at: 'd6' put: (MyQueen black ).
	board at: 'e5' put: (MyKnight black ).
	
	self deny: king isCheckMated.
]

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
