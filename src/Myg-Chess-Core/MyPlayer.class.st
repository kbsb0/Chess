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

	| handlers |
	handlers := OrderedCollection new.
	handlers add: MyGameCapture new.
	handlers add: MyGameBlock new.
	handlers add: MyKingMove new.
	handlers add: MyGameDefaultMove new.


	handlers
		detect: [ :handler | handler handleRequest: self ]
		ifNone: [ "self halt: 'NO MOVES AVAILABLE!'" ]
]

{ #category : 'as yet unclassified' }
MyPlayer >> threateningPieces: aKing [

	^ aKing threateningPieces
]

{ #category : 'constants' }
MyPlayer >> white [

	self color: Color white
]
