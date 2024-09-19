Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	| squares squaresWithOppoment |
	squares := 
	( self isWhite
		           ifTrue: [  
			"square file traceCr."
								( square file = $2 ) ifTrue: [  { square up },  { square up up } ]
															ifFalse: [ { square up } ]
									]
		           ifFalse: [ 
			( square file = $7 ) ifTrue:  [ 
				
				 {   square down },  { square down down } 
				 				]
							ifFalse: [{ square down } ]]
	)
		
		 
	select: [ :s |
		  s notNil and: [ s hasPiece not  ] ] .
		
	squaresWithOppoment := 
	( self isWhite
		           ifTrue: [ { square upLeft }, { square upRight }]
		           ifFalse: [ { square downLeft }, { square downRight } ] )
		select: [ :s | s notNil and: [ s hasPiece and: [ s contents color ~= color ] ] ].
		
	
	
						

	^ ( squares, squaresWithOppoment ).
]
