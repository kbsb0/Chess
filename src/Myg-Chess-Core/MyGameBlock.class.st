Class {
	#name : 'MyGameBlock',
	#superclass : 'MyGameMove',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'public' }
MyGameBlock >> handleRequest: aPlayer [ 
    | king blockingSquares toBlock pieceToMove |
    king := aPlayer king.
    blockingSquares := king threateningSquares.

    blockingSquares ifNotEmpty: [
        "on cherche une pièce qui peut bloquer la menace"
        toBlock := blockingSquares detect: [:blockSquare |
            (aPlayer pieces anySatisfy: [:piece | 
                (piece legalTargetSquares includes: blockSquare)
            ])
        ] ifNone: [ nil ].

        toBlock ifNotNil: [
            pieceToMove := aPlayer pieces detect: [:piece | 
                (piece legalTargetSquares includes: toBlock)
            ].
            aPlayer game move: pieceToMove to: toBlock.
            ^ true 
        ].
    ].

    ^ false
]
