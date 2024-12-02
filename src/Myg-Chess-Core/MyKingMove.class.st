Class {
	#name : 'MyKingMove',
	#superclass : 'MyGameMove',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'public' }
MyKingMove >> handleRequest: aPlayer [ 
    | king legalMoves |
    king := aPlayer king.

    "si le roi est en échec, on tente de le déplacer"
    king isInCheck ifTrue: [
        legalMoves := king legalTargetSquares.
        legalMoves ifNotEmpty: [
            aPlayer game move: king to: legalMoves atRandom.
            ^ true 
        ].
    ].

    ^ false
]
