Class {
	#name : 'MyPlayerTest',
	#superclass : 'TestCase',
	#instVars : [
		'player',
		'board',
		'game',
		'king'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPlayerTest >> setUp [

	super setUp.
	board := MyChessBoard empty.
	game := MyChessGame freshGame.

	board at: 'h1' put: (king := MyKing white).

	player := MyPlayer new.
	player white.
	player game: game.
	game board: board
]

{ #category : 'tests' }
MyPlayerTest >> testKingCanMoveOutOfCheck [

	| blackRook1 blackRook2 |
	board at: 'h8' put: (blackRook1 := MyRook black).
	board at: 'a2' put: (blackRook2 := MyRook black).

	self assert: king isInCheck.

	player play.

	self assert: king isInCheck not.

	self assert: (board locate: 'g1') equals: king
]

{ #category : 'tests' }
MyPlayerTest >> testKingMovesWhenNotInCheck [

	| whitePawn |
	self assert: king isInCheck not.

	player play.

	"assert false: le roi est en h1 et le pion est en h2 (une des deux pièces s'est donc déplacé)"
	self deny:
		((board locate: 'h1') = king and: [
			 (board locate: 'h2') = whitePawn ]).
	self assert: king isInCheck not
]

{ #category : 'tests' }
MyPlayerTest >> testPieceCanBlockThreatAndDontMove [

	| blackRook1 blackRook2 whiteBishop blackQueen |
	board at: 'h8' put: (blackRook1 := MyRook black).
	board at: 'a2' put: (blackRook2 := MyRook black).
	board at: 'd1' put: (whiteBishop := MyBishop white).
	board at: 'g8' put: (blackQueen := MyQueen black).

	self assert: king isInCheck.

	player play.

	self assert: king isInCheck not.

	self assert: (board locate: 'h1') equals: king.
	self assert: (board locate: 'h5') equals: whiteBishop.
	self assert: (board locate: 'h8') equals: blackRook1.
	self assert: (board locate: 'a2') equals: blackRook2.
	self assert: (board locate: 'g8') equals: blackQueen
]

{ #category : 'tests' }
MyPlayerTest >> testPieceCanBlockThreatAndMove [

	| blackRook1 blackRook2 whiteBishop |
	board at: 'h8' put: (blackRook1 := MyRook black).
	board at: 'a2' put: (blackRook2 := MyRook black).
	board at: 'd1' put: (whiteBishop := MyBishop white).

	self assert: king isInCheck.

	player play.

	self assert: king isInCheck not.

	self assert: (board locate: 'h1') equals: king.
	self assert: (board locate: 'h5') equals: whiteBishop.
	self assert: (board locate: 'h8') equals: blackRook1.
	self assert: (board locate: 'a2') equals: blackRook2
]

{ #category : 'tests' }
MyPlayerTest >> testPieceCanCaptureThreat [

	| blackRook1 blackRook2 whiteBishop blackQueen |
	board at: 'h5' put: (blackRook1 := MyRook black).
	board at: 'a2' put: (blackRook2 := MyRook black).
	board at: 'd1' put: (whiteBishop := MyBishop white).
	board at: 'g8' put: (blackQueen := MyQueen black).

	self assert: king isInCheck.

	player play.

	self assert: king isInCheck not.

	self assert: (board locate: 'h1') equals: king.
	self assert: (board locate: 'h5') equals: whiteBishop.
	self assert: (board locate: 'a2') equals: blackRook2.
	self assert: (board locate: 'g8') equals: blackQueen
]

{ #category : 'tests' }
MyPlayerTest >> testPieceCanCaptureThreatAndMove [

	| blackRook1 blackRook2 whiteBishop |
	board at: 'h5' put: (blackRook1 := MyRook black).
	board at: 'a2' put: (blackRook2 := MyRook black).
	board at: 'd1' put: (whiteBishop := MyBishop white).


	self assert: king isInCheck.

	player play.

	self assert: king isInCheck not.

	self assert: (board locate: 'h1') equals: king.
	self assert: (board locate: 'h5') equals: whiteBishop.
	self assert: (board locate: 'a2') equals: blackRook2
]
