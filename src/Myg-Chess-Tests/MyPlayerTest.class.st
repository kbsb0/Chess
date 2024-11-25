Class {
	#name : 'MyPlayerTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPlayerTest >> testKingCanMoveOutOfCheck [ 
    | player board game king blackRook1 blackRook2 |

    board := MyChessBoard empty. 
	 game := MyChessGame freshGame.
	
 	 board at: 'h1' put: (king := MyKing white).
	 board at: 'h8' put: (blackRook1 := MyRook black).
	 board at: 'a2' put: (blackRook2 := MyRook black).

    player := MyPlayer new. 
	 player white.
    player game: game. 
	 player game board: board.
	
    self assert: king isInCheck.

    player play. 

    self assert: (king isInCheck) not.

	 self assert: (board locate: 'g1') equals: king. 





]

{ #category : 'tests' }
MyPlayerTest >> testKingMovesWhenNotInCheck [
    | player board game king whitePawn |

    board := MyChessBoard empty.
    game := MyChessGame freshGame.
    
    board at: 'h1' put: (king := MyKing white).
    board at: 'h2' put: (whitePawn := MyPawn white).

    player := MyPlayer new.
    player white.
    player game: game.
    player game board: board.
    
    self assert: king isInCheck not.
    
    player play.

	"assert false: le roi est en h1 et le pion est en h2 (une des deux pièces a bougé)"
    self deny: ((board locate: 'h1') = king and: [(board locate: 'h2') = whitePawn]).
    self assert: king isInCheck not.
    
]

{ #category : 'tests' }
MyPlayerTest >> testPieceCanBlockThreat [ 
| player board game king blackRook1 blackRook2 whiteBishop  blackQueen|

    board := MyChessBoard empty. 
	 game := MyChessGame freshGame.
	
 	 board at: 'h1' put: (king := MyKing white).
	 board at: 'h8' put: (blackRook1 := MyRook black).
	 board at: 'a2' put: (blackRook2 := MyRook black).
	 board at: 'd1' put: (whiteBishop := MyBishop white).
	 board at: 'g8' put: (blackQueen := MyQueen black).

    player := MyPlayer new. 
	 player white.
    player game: game. 
	 player game board: board.
	
    self assert: king isInCheck.

    player play. 

    self assert: (king isInCheck) not.

	 self assert: (board locate: 'h1') equals: king. 
	 self assert: (board locate: 'h5') equals: whiteBishop.
	 self assert: (board locate: 'h8') equals: blackRook1.
	 self assert: (board locate: 'a2') equals: blackRook2.
	 self assert: (board locate: 'g8') equals: blackQueen.






]

{ #category : 'tests' }
MyPlayerTest >> testPieceCanCaptureThreat [ 
| player board game king blackRook1 blackRook2 whiteBishop blackQueen|

    board := MyChessBoard empty. 
	 game := MyChessGame freshGame.
	
 	 board at: 'h1' put: (king := MyKing white).
	 board at: 'h5' put: (blackRook1 := MyRook black).
	 board at: 'a2' put: (blackRook2 := MyRook black).
	 board at: 'd1' put: (whiteBishop := MyBishop white).
	 board at: 'g8' put: (blackQueen := MyQueen black).

    player := MyPlayer new. 
	 player white.
    player game: game. 
	 player game board: board.
	
    self assert: king isInCheck.

    player play. 

    self assert: (king isInCheck) not.

	 self assert: (board locate: 'h1') equals: king. 
	 self assert: (board locate: 'h5') equals: whiteBishop.
	 self assert: (board locate: 'a2') equals: blackRook2.
		 self assert: (board locate: 'g8') equals: blackQueen.







]
