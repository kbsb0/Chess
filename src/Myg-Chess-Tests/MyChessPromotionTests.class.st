Class {
	#name : 'MyChessPromotionTests',
	#superclass : 'TestCase',
	#instVars : [
		'board',
		'pawn',
		'promotion'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'initialization' }
MyChessPromotionTests >> initialize [ 

	
	board := MyChessBoard empty.
	board at: 'c3' put: (pawn := MyPawn white).
	promotion := MyChessPromotion new.
]

{ #category : 'tests' }
MyChessPromotionTests >> testAddPieceChoice [
	| pieceChoice btn |
	
	promotion := MyChessPromotion new.
	pieceChoice := pawn.
	promotion addPieceChoice: pieceChoice.
	self assert: (promotion pane children size > 0).
	btn := promotion pane children first.
	self assert: (btn labelText = pieceChoice description).
]

{ #category : 'tests' }
MyChessPromotionTests >> testAddPiecesChoice [ 
	| labelTexts expectedlabelTexts myChoiceClass| 
	
	promotion := MyChessPromotion new.
	self should: [ promotion addPiecesChoice. ] raise: Error.
	
	promotion piece: pawn.
	promotion addPiecesChoice.
	
	labelTexts := promotion pane children collect: [ :child | child labelText ].
	myChoiceClass := {   MyQueen . MyRook . MyBishop  . MyKnight  }.
	expectedlabelTexts := myChoiceClass collect: [ :class | class black description ].
	
	self assert: (promotion pane children size = 4).
	expectedlabelTexts do: [ :label | 
		self assert: (labelTexts includes: label).
	].
	
	
	
	
	
	
	
	

]

{ #category : 'tests' }
MyChessPromotionTests >> testChangeWith [ 
	| originalPiece newPiece square|

	promotion := MyChessPromotion new.
	originalPiece := pawn.
	square := originalPiece square.
	newPiece := MyQueen white.
	promotion piece: originalPiece.
	self assert: (promotion choiceHasBeenMade) equals: false.
	promotion changeWith: newPiece.
	self assert: (promotion choiceHasBeenMade).
	self assert: (newPiece square) equals: square.
	self assert: (square contents) equals: newPiece.
	
	

]

{ #category : 'tests' }
MyChessPromotionTests >> testClose [ 
	promotion := MyChessPromotion new.
	promotion piece: pawn.
	promotion close.
	self assert: (promotion window isOpened) equals: false.

]

{ #category : 'tests' }
MyChessPromotionTests >> testHandleChoice [ 
	
	 promotion piece: pawn. 
	self assert: (promotion choiceHasBeenMade = false).
	promotion handleChoice.
	self assert: (promotion choiceHasBeenMade = true).

]

{ #category : 'tests' }
MyChessPromotionTests >> testInitialize [ {
	
	self assert: (promotion choiceHasBeenMade = false).
	self assert: (promotion host isNil not).
	self assert: (promotion window isNil not).
}
]

{ #category : 'tests' }
MyChessPromotionTests >> testRandomChoice [ 
	| square |
	
	promotion piece: pawn.
	square := pawn square.
	promotion randomChoice.
	self assert: (square contents isKindOf: MyQueen).

]
