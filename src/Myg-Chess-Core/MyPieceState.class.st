Class {
	#name : 'MyPieceState',
	#superclass : 'Object',
	#instVars : [
		'piece',
		'strategy'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'visiting' }
MyPieceState >> accept: visitor [
	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
MyPieceState >> classicalMove [
	self subclassResponsibility
]

{ #category : 'accessing' }
MyPieceState >> piece [
	^ piece.
]

{ #category : 'accessing' }
MyPieceState >> piece: aPiece [
	piece:= aPiece.
]

{ #category : 'as yet unclassified' }
MyPieceState >> specialDoubleAdvanceMove [
	self subclassResponsibility
]
