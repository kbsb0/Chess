Class {
	#name : 'MyGameMove',
	#superclass : 'Object',
	#instVars : [
		'nextHandler',
		'next'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyGameMove >> handle: aPlayer [

	^ false
]

{ #category : 'initialization' }
MyGameMove >> setGame: aPlayer [

	^ aPlayer game
]

{ #category : 'initialization' }
MyGameMove >> setKing: aPlayer [

	^ aPlayer king
]
