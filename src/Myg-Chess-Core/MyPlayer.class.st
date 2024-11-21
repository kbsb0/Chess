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
    | pieces king threateningPieces blockingSquares menace toAdd addingPosition|
    
	 menace := false.
    king := self king.
    
    "On vérifie si le roi est en échec, si c'est le cas alors on identifie les pièces menaçantes"
    threateningPieces := king isInCheck
        ifTrue: [ king threateningPieces ]
        ifFalse: [ #() ].

    "Si le roi est en échec, on doit trouver les pièces qui protègent le roi"
    pieces := king isInCheck
        ifTrue: [ 
            "On doit essayer de déplacer une pièce pour protéger le roi"
            (self pieces select: [:piece | 
                | canCapture canBlock canMove |
					"Est-ce que la pièce peut capturer une pièce menaçante ?"
                canCapture := threateningPieces anySatisfy: [:threat | 
                    (piece legalTargetSquares includes: threat square)
						
                ].
					menace := true.
					"méthode pour obtenir les cases qui permetterait de bloquer l'attaque
                blockingSquares := self pieces blockingSquaresToPreventCheck.
					Est-ce que la pièce peut aller sur les cases qui permettent de bloquer l'attaque
                canBlock := blockingSquares anySatisfy: [:blockSquare | 
                    (piece legalTargetSquares includes: blockSquare)
                ]."
					"Est-ce que le roi peut se délpacer ?"
                canMove := (piece = king and: [(king legalTargetSquares notEmpty)]).
					canMove  ifTrue: [menace := false].
                "canCapture or: [canBlock or: [canMove]]"
					 canCapture or: canMove
            ]) asOrderedCollection 
        ]
        ifFalse: [ self pieces copy asOrderedCollection ].

		"déplacement des pièces"
    [ pieces notEmpty ] whileTrue: [
        | piece legalMoves |
        piece := pieces atRandom.
        pieces remove: piece.
		menace ifTrue: [ legalMoves := OrderedCollection new. 
			toAdd := threateningPieces atRandom.
			addingPosition := toAdd square .
			legalMoves add: addingPosition ]
		 ifFalse: [legalMoves := piece legalTargetSquares].
        legalMoves ifNotEmpty: [
            game move: piece to: legalMoves atRandom.
            ^ self] ].

    self halt: 'NO MOVES AVAILABLE!'.

]

{ #category : 'constants' }
MyPlayer >> white [

	self color: Color white
]
