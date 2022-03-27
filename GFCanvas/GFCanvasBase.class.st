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

{ #category : #accessing }
GFCanvasBase >> circle: radius [
	^ self subclassResponsibility
]

{ #category : #'path commands' }
GFCanvasBase >> drawLines: vertices [
	^ self subclassResponsibility 
]

{ #category : #accessing }
GFCanvasBase >> drawPolygon3: obj [
	|v|
	self world local: obj local.
	v := obj vertices collect: [ :each | self world * each ].
	self drawLines: v
]

{ #category : #accessing }
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

{ #category : #'as yet unclassified' }
GFCanvasBase >> ellipse: radius flattening: flattening [
	^ self subclassResponsibility 
]

{ #category : #accessing }
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

{ #category : #'instance creation' }
GFCanvasBase >> from: pos [
	self world from: pos
]

{ #category : #'path commands' }
GFCanvasBase >> lineTo: pos [
	^ self subclassResponsibility 
]

{ #category : #'path commands' }
GFCanvasBase >> moveTo: pos [
	self pen pos: pos
]

{ #category : #'instance creation' }
GFCanvasBase >> open [
	^ self subclassResponsibility 
]

{ #category : #accessing }
GFCanvasBase >> paper [

	^ paper
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
GFCanvasBase >> world [

	^ world ifNil: [ world := GFCamera new ]
]

{ #category : #accessing }
GFCanvasBase >> world: anObject [

	world := anObject
]
