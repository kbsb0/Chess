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

{ #category : 'path commands' }
MyPawn >> moveTo: aSquare [

    | op nbSquareMove oldFile |
    op := self isWhite
              ifTrue: [ [ :s | s down ] ]
              ifFalse: [ [ :s | s up ] ].

    oldFile := square file.
    (self legalTargetSquares includes: aSquare)
        ifFalse: [ ^ self ]
        ifTrue: [
            square emptyContents.
            square := aSquare.
            aSquare contents: self.
            aSquare enPassantTarget ifTrue: [
                (op value: aSquare) emptyContents.
                aSquare enPassantTarget: false ] ].


    nbSquareMove := (square file asciiValue - oldFile asciiValue) abs.

    nbSquareMove = 2
        ifTrue: [ self state specialDoubleAdvanceMove ]
        ifFalse: [ self state classicalMove ]
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'as yet unclassified' }
MyPawn >> targetSquaresLegal: aBoolean [

	| op basicMoveSquare diagonalMoveSquare passantMoveSquare |
	op := self isWhite
		      ifTrue: [ [ :s | s up ] ]
		      ifFalse: [ [ :s | s down ] ].

	basicMoveSquare := { (op value: square) }
	                   , { ((op value: square) notNil and: [
			                    (op value: square) contents
				                    ifNil: [
					                    self state accept:
						                    (MyPieceTargetSquareVisitor new strategy:
							                     'moveDouble') ]
				                    ifNotNil: [ nil ] ]) } select: [ :s |
		                   s notNil and: [ s contents isNil ] ].


	diagonalMoveSquare := (({ square left } , { square right } select: [
		                        :s | s notNil ]) collect: [ :s |
		                       op value: s ]) select: [ :s |
		                      s notNil and: [
			                      s contents notNil and: [
				                      s contents color ~= color ] ] ].


	passantMoveSquare := ({ square left } , { square right } select: [ :s |
		                      s notNil and: [
			                      s hasPiece and: [ s contents color ~= color ] ] ])
		                     collect: [ :s |
			                     s contents state accept:
				                     (MyPieceTargetSquareVisitor new strategy:
					                      'moveEnPassant') ].

	^ basicMoveSquare , diagonalMoveSquare , passantMoveSquare select: [
		  :s | s notNil ]
]
