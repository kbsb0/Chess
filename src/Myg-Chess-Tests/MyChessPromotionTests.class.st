Class {
	#name : 'MyChessPromotionTests',
	#superclass : 'TestCase',
	#instVars : [
		'board',
		'pawn'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'initialization' }
MyChessPromotionTests >> initialize [ 

	
	board := MyChessBoard empty.
	board at: 'c3' put: (pawn := MyPawn white).
]

{ #category : 'tests' }
MyChessPromotionTests >> testAddPieceChoice [
	| promotion pieceChoice btn |
	
	promotion := MyChessPromotion new.
	pieceChoice := pawn.
	promotion addPieceChoice: pieceChoice.
	self assert: (promotion pane children size > 0).
	btn := promotion pane children first.
	self assert: (btn labelText = pieceChoice description).
]

{ #category : 'tests' }
MyChessPromotionTests >> testAddPiecesChoice [ 
	| promotion labelTexts expectedlabelTexts myChoiceClass| 
	
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
	| promotion originalPiece newPiece square|

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
