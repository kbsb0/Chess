Class {
	#name : 'MyPieceMoveStrategy',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPieceMoveStrategy >> nextSquare: square [

	self subclassResponsibility
]
