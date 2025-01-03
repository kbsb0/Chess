Class {
	#name : 'MyPlayerColorBlackState',
	#superclass : 'MyPlayerColorState',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyPlayerColorBlackState >> nextStatePlayer [

	game moveCount: game moveCount + 1.
	game playerColorState: (MyPlayerColorWhiteState new game: game).
	game currentPlayer: (game whitePlayer).
]
