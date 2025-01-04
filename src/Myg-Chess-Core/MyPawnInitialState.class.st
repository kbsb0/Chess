Class {
	#name : 'MyPawnInitialState',
	#superclass : 'MyPieceInitialState',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyPawnInitialState >> classicalMove [

	piece state: (MyPawnMovingState new piece: piece)
]
