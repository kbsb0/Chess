Class {
	#name : 'MyGameCapture',
	#superclass : 'MyGameMove',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'public' }
MyGameCapture >> handleRequest: aPlayer [ 
    | king threateningPieces toCapture |
    king := aPlayer king.
    threateningPieces := aPlayer threateningPieces: king.

    threateningPieces ifNotEmpty: [
        "on recherche une pièce pour capturer une menace"
        toCapture := threateningPieces detect: [:threat | 
            (aPlayer pieces anySatisfy: [:piece | 
                (piece legalTargetSquares includes: threat square)
            ])
        ] ifNone: [ nil ].

        toCapture ifNotNil: [
            | pieceToMove |
            pieceToMove := aPlayer pieces detect: [:piece | 
                (piece legalTargetSquares includes: toCapture square)
            ].
            aPlayer game move: pieceToMove to: toCapture square.
            ^ true 
        ].
    ].
    ^ false
]
