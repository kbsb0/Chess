Class {
	#name : 'MyPieceState',
	#superclass : 'Object',
	#instVars : [
		'piece'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

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
