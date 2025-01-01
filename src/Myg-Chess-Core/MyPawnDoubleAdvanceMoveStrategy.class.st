Class {
	#name : 'MyPawnDoubleAdvanceMoveStrategy',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'execution' }
MyPawnDoubleAdvanceMoveStrategy >> execute:piece [
	piece state: (MyPieceInitialState new piece: piece).
]
