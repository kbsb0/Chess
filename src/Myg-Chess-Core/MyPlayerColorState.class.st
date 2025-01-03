Class {
	#name : 'MyPlayerColorState',
	#superclass : 'Object',
	#instVars : [
		'game'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPlayerColorState >> game [

	^ game 
]

{ #category : 'accessing' }
MyPlayerColorState >> game: aGame [
	game := aGame
]

{ #category : 'as yet unclassified' }
MyPlayerColorState >> nextStatePlayer [
	self subclassResponsibility 
]
