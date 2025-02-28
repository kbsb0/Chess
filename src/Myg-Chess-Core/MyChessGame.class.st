"
# Example

```
board := MyChessGame freshGame.
board size: 800@600.
space := BlSpace new.
space root addChild: board.
space pulse.
space resizable: true.
space show.
```
"
Class {
	#name : 'MyChessGame',
	#superclass : 'BlElement',
	#instVars : [
		'board',
		'currentPlayer',
		'whitePlayer',
		'blackPlayer',
		'moveCount',
		'movesLabel',
		'moveCountLabel',
		'moves',
		'dsp',
		'lastPiece',
		'playerColorState'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'instance creation' }
MyChessGame class >> freshGame [

	^ self fromFENString: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'
]

{ #category : 'instance creation' }
MyChessGame class >> fromFENString: aFENString [

	^ super new
		  initializeFromFENGame: (MyFENParser parse: aFENString);
		  yourself
]

{ #category : 'instance creation' }
MyChessGame class >> new [
	
	self error: 'Please use one of the other constructors'
]

{ #category : 'accessing' }
MyChessGame >> blackPlayer [

	^ blackPlayer.
]

{ #category : 'accessing' }
MyChessGame >> blackPlayer: aBP [
	blackPlayer := aBP.
]

{ #category : 'accessing' }
MyChessGame >> board [
	^ board.
]

{ #category : 'accessing' }
MyChessGame >> board: anObject [
	board := anObject .
]

{ #category : 'as yet unclassified' }
MyChessGame >> changeLastPiece: piece [



	self lastPiece ifNotNil: [ self lastPiece state classicalMove ].
	self lastPiece: piece
]

{ #category : 'as yet unclassified' }
MyChessGame >> checkForMate [

	whitePlayer king isCheckMated ifTrue: [ self halt: 'Black wins!' ].
	blackPlayer king isCheckMated ifTrue: [ self halt: 'White wins!' ].
]

{ #category : 'accessing' }
MyChessGame >> currentPlayer [

	^ currentPlayer.
]

{ #category : 'accessing' }
MyChessGame >> currentPlayer: aPlayer [

	currentPlayer := aPlayer.
]

{ #category : 'initialization' }
MyChessGame >> initialize [

	super initialize.
	self initializeFonts.

	moves := OrderedCollection new.
	whitePlayer := MyPlayer new white game: self.
	blackPlayer := MyPlayer new black game: self.
	playerColorState := MyPlayerColorWhiteState new game: self.
]

{ #category : 'initialization' }
MyChessGame >> initializeFonts [

	"We use fonts to render the characters, and they should be loaded (and downloaded if not there yet)"
	| library |
	library := AeFTLibrary newInitialized.
	MyOpenChessDownloadedFont new
		downloadDirectory: AeFilesystemResources downloadedFontsDirectory;
		ensureDownloaded;
		firstFaceUsing: library.


	AeFontManager resetGlobalInstance.
	AeFontManager globalInstance scanDirectory:
		AeFilesystemResources fontsDirectory
]

{ #category : 'initialization' }
MyChessGame >> initializeFromFENGame: aFENGame [

	| button infoPane |
	aFENGame sideToMove = 'White'
		ifTrue: [ currentPlayer := whitePlayer ]
		ifFalse: [ currentPlayer := blackPlayer ].
		
	moveCount := aFENGame moveCount.

	board := MyChessBoard fromFENBoard: aFENGame board.
	board game: self.
	button := ToButton new.
	button labelText: 'Play!'.
	button whenClickedDo: [ self play ].
	
	infoPane := ToElement new.
	infoPane constraintsDo: [ :c | 
		        c vertical fitContent.
		        c horizontal matchParent ].
	infoPane layout: BlLinearLayout vertical.
	infoPane layout cellSpacing: 10.
	infoPane margin: (BlInsets all: 20).
	infoPane matchParent.
	
	movesLabel := ToLabel new beMultiLine.
	movesLabel matchParent.

	self addChild: board.
	self addChild: infoPane.
	infoPane addChild: movesLabel.
	infoPane addChild: button.

	self layout: BlLinearLayout horizontal.
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal fitContent.
		aLayoutConstraints vertical fitContent ]
]

{ #category : 'accessing' }
MyChessGame >> lastPiece [
	^ lastPiece.
]

{ #category : 'accessing' }
MyChessGame >> lastPiece: piece [
	lastPiece:= piece.
]

{ #category : 'public' }
MyChessGame >> move: piece to: square [

	(currentPlayer color = piece color and: [ piece square ~= square ])
		ifFalse: [ ^ self ].
	piece moveTo: square.
	self recordMovementOf: piece to: square.
	self playerColorState nextStatePlayer.
	self changeLastPiece: piece.
]

{ #category : 'accessing' }
MyChessGame >> moveCount [ 
	^ moveCount.
]

{ #category : 'accessing' }
MyChessGame >> moveCount: aMoveCount [ 
	moveCount := aMoveCount.
]

{ #category : 'accessing' }
MyChessGame >> pieces [

	^ board pieces
]

{ #category : 'playing' }
MyChessGame >> play [

	currentPlayer play.
	self checkForMate
]

{ #category : 'accessing' }
MyChessGame >> playerColorState [

	^ playerColorState.
]

{ #category : 'accessing' }
MyChessGame >> playerColorState: aPlayerColorState [
	playerColorState := aPlayerColorState.
]

{ #category : 'moves' }
MyChessGame >> recordMovementOf: aPiece to: aSquare [
	"moves add: (MyMove piece: aPiece square: aSquare name)."

	| prefix movesText |
	prefix := currentPlayer isWhite
		          ifTrue: [ moveCount asString , '.' ]
		          ifFalse: [ '' ].
	moves add: prefix , ' ' , aPiece id , aSquare name.
	
	movesText := String streamContents: [ :stream |
		| currentLine |
		currentLine := ''.
		moves do: [ :m |
			currentLine := currentLine, ' ', m.
			currentLine size > 20 ifTrue: [ 
				stream nextPutAll: currentLine.
				stream cr.
				currentLine := ''.
			]
		].
		stream nextPutAll: currentLine
	].
	
	movesLabel text: movesText
]

{ #category : 'accessing' }
MyChessGame >> whitePlayer [

	^ whitePlayer.
]

{ #category : 'accessing' }
MyChessGame >> whitePlayer: aWhitePlayer [
	whitePlayer := aWhitePlayer.
]
