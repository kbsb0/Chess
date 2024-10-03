Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#instVars : [
		'movesForward2',
		'moveEnPassant',
		'moveEnPassantL',
		'moveEnPassantR'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'initialization' }
MyPawn >> initialize [

	self movesForward2: false.
	self moveEnPassantL: false.
	self moveEnPassantR: false.
]

{ #category : 'accessing' }
MyPawn >> moveEnPassant [
	^ moveEnPassant.
]

{ #category : 'as yet unclassified' }
MyPawn >> moveEnPassant: bool [
	"true : la piece peut se déplacer avec la prise en passant"
	moveEnPassant := bool.
]

{ #category : 'accessing' }
MyPawn >> moveEnPassantL [

	^ moveEnPassantL
]

{ #category : 'as yet unclassified' }
MyPawn >> moveEnPassantL: bool [
	"true : la piece peut se déplacer avec la prise en passant à gauche"

	moveEnPassantL := bool
]

{ #category : 'accessing' }
MyPawn >> moveEnPassantR [

	^ moveEnPassantR
]

{ #category : 'as yet unclassified' }
MyPawn >> moveEnPassantR: bool [
	"true : la piece peut se déplacer avec la prise en passant à gauche"

	moveEnPassantR := bool
]

{ #category : 'path commands' }
MyPawn >> moveTo: aSquare [
	"On compare l'anciene pos avec la nouvelle. Si la différence de file est de 2, 
	cela veut dire que le pion peut être pris avec la prise en passant."

	| oldFile nbSquareMove |
	oldFile := square file.
	"super moveTo: aSquare."

	"------"

	"PRISE EN PASSANT A GAUCHE"



	

				self moveEnPassantL ifTrue: [
			(self legalTargetSquares includes: aSquare) ifFalse: [ ^ self ].
			square emptyContents.
			square left emptyContents.
			square := aSquare.
			aSquare contents: self.
			self moveEnPassantL: false.
			^ self ].


		"PRISE EN PASSANT A DROITE"
		self moveEnPassantR ifTrue: [
			(self legalTargetSquares includes: aSquare) ifFalse: [ ^ self ].
			square emptyContents.
			square right emptyContents.
			square := aSquare.
			aSquare contents: self.
			self moveEnPassantR: false.
			^ self ].
		
		
		








	(self legalTargetSquares includes: aSquare) ifFalse: [ ^ self ].

	square emptyContents.
	square := aSquare.
	aSquare contents: self.
	"------"


	nbSquareMove := (square file asciiValue - oldFile asciiValue) abs.
	self movesForward2: nbSquareMove = 2
]

{ #category : 'accessing' }
MyPawn >> movesForward2 [
	^ movesForward2.
]

{ #category : 'accessing' }
MyPawn >> movesForward2: bool [
	movesForward2 := bool.
	
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	| squares squaresWithOppoment enPassantW enPassantB |
	squares := (self isWhite
		            ifTrue: [
			            square file = $2
				            ifTrue: [ { square up } , { square up up } ]
				            ifFalse: [ { square up } ] ]
		            ifFalse: [
			            square file = $7
				            ifTrue: [ { square down } , { square down down } ]
				            ifFalse: [ { square down } ] ]) select: [ :s |
		           s notNil and: [ s hasPiece not ] ].

	squaresWithOppoment := (self isWhite
		                        ifTrue: [
		                        { square upLeft } , { square upRight } ]
		                        ifFalse: [
		                        { square downLeft } , { square downRight } ])
		                       select: [ :s |
			                       s notNil and: [
				                       s hasPiece and: [
					                       s contents color ~= color ] ] ].


	enPassantW := (self isWhite and: [ square file = $5 ])
		              ifTrue: [
			              ({ square left } , { square right } select: [ :s |
				               s notNil and: [
					               s hasPiece and: [
						               s contents color ~= color and: [
							               s contents movesForward2 ] ] ] ]) collect: [ :s |
				              s up ] ]
		              ifFalse: [ {  } ].

	enPassantB := (self isWhite not and: [ square file = $4 ])
		              ifTrue: [
			              ({ square left } , { square right } select: [ :s |
				               s notNil and: [
					               s hasPiece and: [
						               s contents color ~= color and: [
							               s contents movesForward2 ] ] ] ]) collect: [ :s |
				              s down ] ]
		              ifFalse: [ {  } ].



	^ squares , squaresWithOppoment , enPassantW , enPassantB
]
