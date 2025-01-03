Class {
	#name : 'MyPlayerColorWhiteState',
	#superclass : 'MyPlayerColorState',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyPlayerColorWhiteState >> nextStatePlayer [

	game playerColorState: (MyPlayerColorBlackState new game: game).
	game currentPlayer: (game blackPlayer).
]
