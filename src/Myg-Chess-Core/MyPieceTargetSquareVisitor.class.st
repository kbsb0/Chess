Class {
	#name : 'MyPieceTargetSquareVisitor',
	#superclass : 'MyPieceStateVisitor',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'visiting' }
MyPieceTargetSquareVisitor >> visitPieceDoubleAdvanceState: piece [

	strategy = 'moveEnPassant' ifTrue: [
		piece isWhite
			ifTrue: [ piece  square down enPassantTarget: true. ^ piece square down ]
			ifFalse: [ piece  square up enPassantTarget: true. ^ piece square up ] ].
	^ nil
]

{ #category : 'visiting' }
MyPieceTargetSquareVisitor >> visitPieceInitialState: piece [

	strategy = 'moveEnPassant' ifTrue: [ ^ nil ].
	strategy = 'moveDouble' ifTrue: [
		^ piece isWhite
			  ifTrue: [ piece square up up]
			  ifFalse: [ piece square down down ] ].
	^ nil 
	"strategy := 'moveEnPassant' ifTrue: [ ^ nil ].
	strategy := 'basicMove' ifTrue: [ ^ nil ].
	strategy := 'diagonalMove' ifTrue: [ ^ piece ].
	^ nil"
]

{ #category : 'visiting' }
MyPieceTargetSquareVisitor >> visitPieceMovingState: piece [
	"self halt."
	strategy = 'moveEnPassant' ifTrue: [ ^ nil ].
	strategy = 'moveDouble' ifTrue: [ ^ nil ].
	^ nil
]
