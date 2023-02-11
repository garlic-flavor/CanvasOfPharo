Class {
	#name : #GFCanvasBase,
	#superclass : #Object,
	#instVars : [
		'paper',
		'pen',
		'fillColor',
		'world'
	],
	#category : #'GFCanvas-Base'
}

{ #category : #'instance creation' }
GFCanvasBase class >> new: paper [
	^ self new
		paper: paper;
		yourself
]

{ #category : #'instance creation' }
GFCanvasBase class >> open: paper [
	^ self new
		paper: paper;
		open;
		yourself
]

{ #category : #adding }
GFCanvasBase >> add: anObject [
	anObject drawOn: self
]

{ #category : #'canvas drawing' }
GFCanvasBase >> circle: radius [
	^ self subclassResponsibility
]

{ #category : #'initialize-release' }
GFCanvasBase >> close [
]

{ #category : #'canvas drawing' }
GFCanvasBase >> drawLines: vertices [
	vertices ifEmpty: [ ^ self ].
	self moveTo: vertices first.
	vertices allButFirstDo: [ :one | self lineTo: one ].

]

{ #category : #'canvas drawing' }
GFCanvasBase >> drawPolygon3: obj [
	|v|
	self world local: obj local.
	v := obj vertices collect: [ :each | self world * each ].
	self drawPolygon: v
]

{ #category : #'canvas drawing' }
GFCanvasBase >> drawPolygon: v [
	^ self subclassResponsibility
]

{ #category : #'canvas drawing' }
GFCanvasBase >> drawPolyline3: obj [
	|v|
	self world local: obj local.
	v := obj vertices collect: [ :each | self world * each ].
	obj indices pairsDo: [ :one :two |
		self
			moveTo: (v at: one);
			lineTo: (v at: two)
	]
]

{ #category : #'canvas drawing' }
GFCanvasBase >> ellipse: radius flattening: flattening [
	^ self subclassResponsibility 
]

{ #category : #export }
GFCanvasBase >> export [
	^ self subclassResponsibility 
]

{ #category : #accessing }
GFCanvasBase >> fillColor [

	^ fillColor ifNil: [ fillColor := Color transparent ]
]

{ #category : #accessing }
GFCanvasBase >> fillColor: anObject [

	fillColor := anObject
]

{ #category : #accessing }
GFCanvasBase >> focalLength: f [
	self world focalLength: f
]

{ #category : #accessing }
GFCanvasBase >> from: pos [
	self world from: pos
]

{ #category : #accessing }
GFCanvasBase >> from: pos to: to [
	self world from: pos to: to
]

{ #category : #'canvas drawing' }
GFCanvasBase >> lineTo: pos [
	^ self subclassResponsibility 
]

{ #category : #'path commands' }
GFCanvasBase >> moveTo: pos [
	self pen pos: pos
]

{ #category : #'initialize-release' }
GFCanvasBase >> open [
	^ self subclassResponsibility 
]

{ #category : #accessing }
GFCanvasBase >> paper [

	^ paper ifNil: [ paper := GFPaper VGAyoko ]
]

{ #category : #accessing }
GFCanvasBase >> paper: anObject [

	paper := anObject.
	self world
		width: paper width value;
		height: paper height value
]

{ #category : #accessing }
GFCanvasBase >> pen [

	^ pen ifNil: [ pen := GFPen new ]
]

{ #category : #accessing }
GFCanvasBase >> pen: anObject [

	pen := anObject
]

{ #category : #accessing }
GFCanvasBase >> penWidth: w [
	self pen width: w
]

{ #category : #accessing }
GFCanvasBase >> world [

	^ world ifNil: [ world := GFCamera new ]
]

{ #category : #accessing }
GFCanvasBase >> world: anObject [

	world := anObject
		width: self paper width value;
		height: self paper height value;
		yourself
]
