Class {
	#name : 'MyKing',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyKing >> attackingSquares [

	^ self basicTargetSquares
]

{ #category : 'rendering' }
MyKing >> basicTargetSquares [

	"The king can move one square on each direction including diagonals"
	^ {
		square ifNotNil: #right.
		square up ifNotNil: #right.
		square ifNotNil: #up.
		square up ifNotNil: #left.
		square ifNotNil: #left.
		square left ifNotNil: #down.
		square ifNotNil: #down.
		square down ifNotNil: #right
	}
]

{ #category : 'accessing' }
MyKing >> description [

	^ 'king'
]

{ #category : 'accessing' }
MyKing >> id [
	
	^ 'K'
]

{ #category : 'testing' }
MyKing >> isCheckMated [
	"We check if the opponent pieces target all my potential movements and myself"

	| threatenedSquares |
	threatenedSquares := self opponentPieces flatCollect: [ :e |
		                     e attackingSquares ].

	^ self legalTargetSquares isEmpty and: [
		  threatenedSquares includes: self square ]
]

{ #category : 'testing' }
MyKing >> isInCheck [
	"We check if the opponent pieces target all my potential movements and myself"

	| threatenedSquares |
	threatenedSquares := self opponentPieces flatCollect: [ :e |
		                     e attackingSquares ].

	^ threatenedSquares includes: self square
]

{ #category : 'testing' }
MyKing >> isKing [
	
	^ true
]

{ #category : 'accessing' }
MyKing >> opponentPieces [

	^ self board pieces select: [ :e |
		  e notNil and: [ e color = color negated ] ]
]

{ #category : 'rendering' }
MyKing >> renderPieceOn: aSquare [

	^ aSquare renderKing: self
]

{ #category : 'rendering' }
MyKing >> targetSquaresLegal: aBoolean [
	"The king cannot move to threatened squares"

	| threatenedSquares |
	threatenedSquares := self opponentPieces flatCollect: [ :e |
		                     e attackingSquares ].

	^ self basicTargetSquares select: [ :s |
		  s notNil and: [
			  (threatenedSquares includes: s) not and: [
				  s hasPiece not or: [ 
					"The square has an opponent piece"
					s contents color ~= color and: [ 
						"Let's hope the piece is not defended"
						threatenedSquares includes: s  ] ] ] ] ]
]

{ #category : 'as yet unclassified' }
MyKing >> threateningPieces [
    | attackingPieces tmp |

attackingPieces := OrderedCollection new.
     tmp:=self isInCheck
        ifTrue: [ 
    "on parcoure toutes les pièces adverses"
    (self opponentPieces) do: [:piece |
        "on vérifie si la pièce peut attaquer le roi"
        (piece legalTargetSquares includes: self square) ifTrue: [
            attackingPieces add: piece.
        ]]].
    
^ attackingPieces.

]

{ #category : 'as yet unclassified' }
MyKing >> threateningSquares [ 
    | threateningPieces threateningPiece threateningSquares |
    threateningPieces := self threateningPieces.

    threateningPieces isEmpty ifTrue: [ ^ #() ].

    threateningPiece := threateningPieces first.
    threateningSquares := threateningPiece targetSquaresLegal: true.
    ^ threateningSquares.
]
