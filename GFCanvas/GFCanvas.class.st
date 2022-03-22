"
an implementation of like a canvas functionality.
"
Class {
	#name : #GFCanvas,
	#superclass : #Object,
	#instVars : [
		'morph',
		'pen',
		'fillColor'
	],
	#category : #GFCanvas
}

{ #category : #'instance creation' }
GFCanvas class >> new: paper [
	^ self new
		paper: paper;
		yourself
]

{ #category : #'instance creation' }
GFCanvas class >> open: paper [
	^ self new
		openPaper: paper;
		yourself
]

{ #category : #accessing }
GFCanvas >> circle: radius [
	|circle|
	circle := CircleMorph new
		extent: radius@radius * 2;
		position: self pen pos + self morph position - (radius@radius);
		color: self fillColor;
		borderColor: self pen color;
		borderWidth: self pen width value;
		yourself.
	self morph addMorph: circle.
	^ circle.
]

{ #category : #'path commands' }
GFCanvas >> drawLines: vertices [
	|poly|
	poly := PolygonMorph
		vertices: vertices
		color: self fillColor
		borderWidth: self pen width value
		borderColor: self pen color.
	poly makeOpen.
	self morph addMorph: poly.
	^ poly
]

{ #category : #'as yet unclassified' }
GFCanvas >> ellipse: radius flattening: flattening [
	|rW rH ellipse|
	rW := radius value.
	rH := rW - (flattening * rW).
	ellipse := EllipseMorph new
		extent: (rW*2)@(rH*2);
		position: self pen pos + self morph position - (rW@rH);
		color: self fillColor;
		borderColor: self pen color;
		borderWidth: self pen width value;
		yourself.
	self morph addMorph: ellipse.
	^ ellipse
]

{ #category : #accessing }
GFCanvas >> export [
	self morph exportAsPNG
]

{ #category : #accessing }
GFCanvas >> fillColor [

	^ fillColor ifNil: [ fillColor := Color transparent ]
]

{ #category : #accessing }
GFCanvas >> fillColor: anObject [

	fillColor := anObject
]

{ #category : #'path commands' }
GFCanvas >> lineTo: pos [
	|line from to|
	from := self pen pos + self morph position.
	to := pos + self morph position.
	line := LineMorph from: from to: to color: pen color width: pen width value.
	self morph addMorph: line.
	self pen pos: pos.
	^ line
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
	self morph: ((Morph
		newBounds: (Rectangle origin: 0@0 extent: (paper width value @ paper height value))
		color: paper color)
			clipSubmorphs: true;
			yourself)


]

{ #category : #accessing }
GFCanvas >> pen [

	^ pen ifNil: [ pen := GFPen new ]
]

{ #category : #accessing }
GFCanvas >> pen: anObject [

	pen := anObject
]

{ #category : #'as yet unclassified' }
GFCanvas >> rotate: aMorph deglee: angle [
	aMorph transformedBy: (self rotationMatrix: angle)
]

{ #category : #'as yet unclassified' }
GFCanvas >> rotationMatrix: angle [
	|rad t1 t2 t3|
	rad := angle * Float pi / 180.
	t1 := MorphicTransform new
		setOffset: (self morph position + self pen pos) * -1;
		yourself.
	t2 := MorphicTransform new
		setAngle: rad;
		yourself.
	t3 := MorphicTransform new
		setOffset: (self morph position + self pen pos);
		yourself.
	^ (t1 composedWith: t2) composedWith: t3
]
