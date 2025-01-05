Class {
	#name : 'MyPawnMovingState',
	#superclass : 'MyPieceMovingState',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyPawnMovingState >> classicalMove [

	| displayChoice |

	 (	(piece moveStrategy nextSquare:(piece square)) isNil) ifTrue: [
		piece board needPromotion: true.
		piece state: (MyPieceMovingState new piece: piece).
		displayChoice := MyChessPromotion new.
		displayChoice piece: piece.
		displayChoice show ].
	^ self
]
