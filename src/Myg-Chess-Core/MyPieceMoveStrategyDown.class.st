Class {
	#name : 'MyPieceMoveStrategyDown',
	#superclass : 'MyPieceMoveStrategy',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPieceMoveStrategyDown >> nextSquare: square [

	^ square down
]
