"
an implementation of like a canvas functionality.
"
Class {
	#name : #GFCanvas,
	#superclass : #Object,
	#instVars : [
		'morph',
		'pen'
	],
	#category : #GFCanvas
}

{ #category : #accessing }
GFCanvas >> circle: radius [
	self morph addMorph: (CircleMorph new
		extent: radius@radius * 2;
		position: self pen pos + self morph position - (radius@radius);
		color: Color transparent;
		borderColor: self pen color;
		borderWidth: self pen width value;
		yourself)
]

{ #category : #'path commands' }
GFCanvas >> lineTo: pos [
	|line from to|
	from := self pen pos + self morph position.
	to := pos + self morph position.
	line := LineMorph from: from to: to color: pen color width: pen width value.
	self morph addMorph: line.
	self pen pos: pos
]

{ #category : #accessing }
GFCanvas >> morph [

	^ morph
]

{ #category : #accessing }
GFCanvas >> morph: anObject [

	morph := anObject
]

{ #category : #'path commands' }
GFCanvas >> moveTo: pos [
	self pen pos: pos
]

{ #category : #'as yet unclassified' }
GFCanvas >> openPaper: paper [
	self paper: paper.
	self morph openInWorld

]

{ #category : #'as yet unclassified' }
GFCanvas >> paper: paper [
	self morph: (Morph
		newBounds: (Rectangle origin: 0@0 extent: (paper width value @ paper height value))
		color: paper color)


]

{ #category : #accessing }
GFCanvas >> pen [

	^ pen ifNil: [ pen := GFPen new ]
]

{ #category : #accessing }
GFCanvas >> pen: anObject [

	pen := anObject
]
