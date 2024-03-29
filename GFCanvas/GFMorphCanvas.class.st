"
an implementation of like a canvas functionality.
"
Class {
	#name : #GFMorphCanvas,
	#superclass : #GFCanvasBase,
	#instVars : [
		'morph'
	],
	#category : #'GFCanvas-Morph'
}

{ #category : #accessing }
GFMorphCanvas >> circle: radius [
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

{ #category : #'initialize-release' }
GFMorphCanvas >> close [
	morph ifNil: [ ^ self ].
	morph delete.
	morph := nil.
]

{ #category : #'path commands' }
GFMorphCanvas >> drawLines: vertices [
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

{ #category : #'canvas drawing' }
GFMorphCanvas >> drawPolygon: vertices [
	|poly|
	poly := PolygonMorph
		vertices: (vertices copyWith: vertices first)
		color: self fillColor
		borderWidth: self pen width value
		borderColor: self pen color.
	poly makeOpen.
	self morph addMorph: poly.
	^ poly
]

{ #category : #'canvas drawing' }
GFMorphCanvas >> ellipse: radius flattening: flattening [
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
GFMorphCanvas >> export [
	self morph exportAsPNG
]

{ #category : #'path commands' }
GFMorphCanvas >> lineTo: pos [
	|line l from to|
	from := self pen pos + self morph position.
	to := pos + self morph position.
	l := GFLine2 start: from end: to.
	l croppedBy: self paper asRectangle.
	l visible ifFalse: [ ^ self ].
	line := LineMorph from: l start to: l end color: pen color width: pen width value.
	self morph addMorph: line.
	self pen pos: pos.
	^ line
]

{ #category : #accessing }
GFMorphCanvas >> morph [

	^ morph ifNil: [
		morph := (Morph
		newBounds: (Rectangle origin: 0@0 extent: (paper width value @ paper height value))
		color: paper color)
			clipSubmorphs: true;
			yourself
	]
]

{ #category : #accessing }
GFMorphCanvas >> morph: anObject [

	morph := anObject
]

{ #category : #'initialize-release' }
GFMorphCanvas >> open [
	self morph openInWorld

]

{ #category : #'scaling, rotation' }
GFMorphCanvas >> rotate: aMorph deglee: angle [
	aMorph transformedBy: (self rotationMatrix: angle)
]

{ #category : #'scaling, rotation' }
GFMorphCanvas >> rotationMatrix: angle [
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
