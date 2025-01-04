Class {
	#name : 'MyChessPromotion',
	#superclass : 'Object',
	#instVars : [
		'host',
		'window',
		'pane',
		'piece'
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
			       Transcript
				       show: nextPiece description;
				       cr.
			       self changeWith: nextPiece.
					 self close.
			       ].

	pane addChild: btn
]

{ #category : 'adding' }
MyChessPromotion >> addPiecesChoice [

	piece isWhite
		ifTrue: [
			self addPieceChoice: MyBishop white.
			self addPieceChoice: MyKnight white.
			self addPieceChoice: MyQueen white.
			self addPieceChoice: MyRook white ]
		ifFalse: [
			self addPieceChoice: MyBishop black.
			self addPieceChoice: MyKnight black.
			self addPieceChoice: MyQueen black.
			self addPieceChoice: MyRook black ]
]

{ #category : 'as yet unclassified' }
MyChessPromotion >> changeWith: newPiece [
	| square |
	square := piece square.
	square contents: newPiece.
	newPiece square: square.
	newPiece state classicalMove.
	
]

{ #category : 'initialize-release' }
MyChessPromotion >> close [
	window close.
]

{ #category : 'initialization' }
MyChessPromotion >> initialize [

	host := BlMorphicWindowHost new.
	window := BlSpace new.

	pane := pane := ToPane horizontal.


]

{ #category : 'accessing' }
MyChessPromotion >> piece [
^ piece 
]

{ #category : 'accessing' }
MyChessPromotion >> piece: aPiece [
	piece := aPiece.
]

{ #category : 'initialization' }
MyChessPromotion >> show [

	self addPiecesChoice.
	window
		in: [ :sp | sp root addChild: pane ];
		"host: host;"
		title: host asString;
		extent: 400 asPoint.

	window show.
	window when: BlSpaceClosedEvent doOnce: [
		Transcript
			show: 'La fenêtre a été fermée';
			cr ]
]
