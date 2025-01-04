Class {
	#name : 'MyChessColor',
	#superclass : 'Color',
	#instVars : [
		'color'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyChessColor >> color [
	^ color
]

{ #category : 'as yet unclassified' }
MyChessColor >> createPiece: pieceClass [

	self subclassResponsibility.
]
