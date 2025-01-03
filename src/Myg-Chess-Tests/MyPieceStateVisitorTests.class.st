Class {
	#name : 'MyPieceStateVisitorTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPieceStateVisitorTests >> testStrategy [
	self
		assert: (MyPieceStateVisitor new strategy: 'strategy') strategy
		equals: 'strategy'
]
