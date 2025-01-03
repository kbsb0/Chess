Class {
	#name : 'MyPieceMoveStrategyUp',
	#superclass : 'MyPieceMoveStrategy',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPieceMoveStrategyUp >> nextSquare: square [

	^ square up
]
