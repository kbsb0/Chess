Class {
	#name : 'MyChessPromotion',
	#superclass : 'Object',
	#instVars : [
		'host',
		'window',
		'pane',
		'piece',
		'choiceHasBeenMade'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'initialization' }
MyChessPromotion >> addPieceChoice: nextPiece [

	| btn icon |
	icon := BlElement new
		        size: 60 @ 20;
		        background: (Color blue alpha: 0.2);
		        yourself.

	btn := ToButton new
		       padding: (BlInsets all: 4);
		       beVertical;
		       label: (ToLabel text: nextPiece description);
		       iconImage: icon;
		       whenClickedDo: [ :ann |
			       self changeWith: nextPiece.
			       self close ].

	pane addChild: btn
]

{ #category : 'adding' }
MyChessPromotion >> addPiecesChoice [

	self addPieceChoice: (piece pieceColor createPiece: MyBishop). 
	self addPieceChoice: (piece pieceColor createPiece: MyKnight).
	self addPieceChoice: (piece pieceColor createPiece: MyQueen).
	self addPieceChoice: (piece pieceColor createPiece: MyRook).
]

{ #category : 'as yet unclassified' }
MyChessPromotion >> changeWith: newPiece [

	| square |
	choiceHasBeenMade := true.
	square := piece square.
	square contents: newPiece.
	newPiece square: square.
	newPiece state classicalMove.
	newPiece board needPromotion: false.
]

{ #category : 'initialize-release' }
MyChessPromotion >> close [
	self handleChoice.
	window close
]

{ #category : 'as yet unclassified' }
MyChessPromotion >> handleChoice [

	choiceHasBeenMade ifFalse: [
		self randomChoice ]
]

{ #category : 'initialization' }
MyChessPromotion >> initialize [
	choiceHasBeenMade := false.
	host := BlMorphicWindowHost new.
	window := BlSpace new.

	pane := pane := ToPane horizontal
]

{ #category : 'accessing' }
MyChessPromotion >> piece [
^ piece 
]

{ #category : 'accessing' }
MyChessPromotion >> piece: aPiece [
	piece := aPiece.
]

{ #category : 'as yet unclassified' }
MyChessPromotion >> randomChoice [
	self changeWith: (piece pieceColor createPiece: MyQueen)

	
]

{ #category : 'initialization' }
MyChessPromotion >> show [

	self piece square emptyContents.
	self addPiecesChoice.
	window
		in: [ :sp | sp root addChild: pane ];
		title: host asString;
		extent: 400 asPoint.

	window show.
	window when: BlSpaceClosedEvent doOnce: [
		self close.
		]
]
