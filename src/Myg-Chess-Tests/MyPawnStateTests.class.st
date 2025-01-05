Class {
	#name : 'MyPawnStateTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnStateTests >> testCorrectStateClassicState [

	| piece initialState |
	"La piece fait un mouvement classique (ancien état: InitialState, nouvel état: MyPieceMovingState)"
	piece := MyPiece new.
	initialState := piece state.
	piece state classicalMove.

	self assert: piece state class equals: MyPieceMovingState.
	self assert: initialState ~= piece state.


	"La piece  fait un mouvement special en avançant de deux ( pion ) (ancien état: InitialState, nouvel état: 	MyPawnDoubleAdvanceState)"
	piece := MyPiece new.
	initialState := piece state.
	piece state specialDoubleAdvanceMove.

	self assert: piece state class equals: MyPawnDoubleAdvanceState.
	self assert: initialState ~= piece state
]

{ #category : 'tests' }
MyPawnStateTests >> testCorrectStateDoubleAdvanceState [

	| piece initialState |
	"La piece fait un mouvement classique (ancien état: MyPawnDoubleAdvanceState, nouvel état: MyPieceMovingState)"
	piece := MyPiece new.
	piece state: (MyPawnDoubleAdvanceState new piece: piece).
	initialState := piece state.
	piece state classicalMove.

	self assert: piece state class equals: MyPawnMovingState.
	self assert: initialState ~= piece state.


	"La piece  fait un mouvement special en avançant de deux ( pion ) (ancien état: MyPawnDoubleAdvanceState, nouvel état: 	MyPawnDoubleAdvanceState)"
	piece := MyPiece new.
	initialState := piece state.
	piece state: (MyPawnDoubleAdvanceState new piece: piece).
	piece state specialDoubleAdvanceMove.

	self assert: piece state class equals: MyPawnDoubleAdvanceState.
	self assert: initialState ~= piece state
]

{ #category : 'tests' }
MyPawnStateTests >> testCorrectStateMovingState [

	| piece initialState |
	"La piece fait un mouvement classique (ancien état: MyPieceMovingState, nouvel état: MyPieceMovingState)"
	piece := MyPiece new.
	piece state: (MyPieceMovingState new piece: piece).
	initialState := piece state.
	piece state classicalMove.

	self assert: piece state class equals: MyPieceMovingState.
	self assert: initialState equals: piece state.
	piece := MyPiece new.
	initialState := piece state.
	piece state: (MyPieceMovingState new piece: piece).
	piece state specialDoubleAdvanceMove.

	self assert: piece state class equals: MyPawnDoubleAdvanceState.
	self assert: initialState ~= piece state
]

{ #category : 'tests' }
MyPawnStateTests >> testPiece [

	| piece |
	piece := MyPiece new.
	self assert: piece state piece equals: piece.

]
