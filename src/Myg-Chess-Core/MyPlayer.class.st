Class {
	#name : 'MyPlayer',
	#superclass : 'Object',
	#instVars : [
		'color',
		'game'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'constants' }
MyPlayer >> black [

	self color: Color black
]

{ #category : 'accessing' }
MyPlayer >> color [

	^ color
]

{ #category : 'accessing' }
MyPlayer >> color: anObject [

	color := anObject
]

{ #category : 'accessing' }
MyPlayer >> game [

	^ game
]

{ #category : 'accessing' }
MyPlayer >> game: anObject [

	game := anObject
]

{ #category : 'testing' }
MyPlayer >> isWhite [
	
	^ color = Color white
]

{ #category : 'accessing' }
MyPlayer >> king [
	
	^ self pieces detect: [ :p | p isKing ]
]

{ #category : 'accessing' }
MyPlayer >> pieces [

	^ game pieces select: [ :p | p notNil and: [ p color = self color ] ]
]

{ #category : 'playing' }
MyPlayer >> play [
    | pieces king threateningPieces blockingSquares menace toCapture toBlock|
    
	 menace := false.
    king := self king.
    
    "Méthode qui va chercher les pièces qui menacent le roi"
    threateningPieces := self threateningPieces: king.

    "Si le roi est en échec, on doit trouver les pièces qui protègent le roi"
    pieces := king isInCheck
        ifTrue: [ 
				menace := true.
            "On doit essayer de déplacer une pièce pour protéger le roi"
            (self pieces select: [:piece | 
                | canCapture canBlock canMove |
					"Est-ce que la pièce peut capturer une pièce menaçante ?"
                canCapture := threateningPieces anySatisfy: [:threat | 
                    (piece legalTargetSquares includes: threat square)				
                ].
					"méthode pour obtenir les cases qui permetterait de bloquer l'attaque"
                blockingSquares := king threateningSquares.
					"Est-ce que la pièce peut aller sur les cases qui permettent de bloquer l'attaque"
                canBlock := blockingSquares anySatisfy: [:blockSquare | 
                    (piece legalTargetSquares includes: blockSquare)
                ].
					"Est-ce que le roi peut se délpacer ?"
                canMove := (piece = king and: [(king legalTargetSquares notEmpty)]).
					canMove  ifTrue: [menace := false].
                canCapture or: [canBlock or: [canMove]]
            ]) asOrderedCollection 
        ]
        ifFalse: [ self pieces copy asOrderedCollection ].

	 "Déplacement des pièces"
    [ pieces notEmpty ] whileTrue: [
        | piece targetSquare legalMoves|
        piece := pieces atRandom.
        pieces remove: piece.

        menace ifTrue: [
            "on essaye de capturer la menace"
            toCapture := threateningPieces detect: [:threat | 
                (piece legalTargetSquares includes: threat square)
            ] ifNone: [ nil ].

            toCapture ifNotNil: [
                targetSquare := toCapture square.
                game move: piece to: targetSquare.
                ^self.
            ].

            "Sinon on essaye de bloquer l'attaque"
            toBlock := blockingSquares detect: [:blockSquare |
                (piece legalTargetSquares includes: blockSquare)
            ] ifNone: [ nil ].

            toBlock ifNotNil: [
                targetSquare := toBlock.
                game move: piece to: targetSquare.
                ^self.
            ].
        ].

        "S'il n'y a pas de menaces on déplace la pièce de façon aléatoire"
        legalMoves := piece legalTargetSquares.
        legalMoves ifNotEmpty: [
            game move: piece to: legalMoves atRandom.
            ^self.
        ].
    ].

    self halt: 'NO MOVES AVAILABLE!'.
]

{ #category : 'as yet unclassified' }
MyPlayer >> threateningPieces: aKing [

^ aKing threateningPieces.

]

{ #category : 'constants' }
MyPlayer >> white [

	self color: Color white
]
