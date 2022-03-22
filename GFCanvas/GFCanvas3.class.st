Class {
	#name : #GFCanvas3,
	#superclass : #GFCanvas,
	#instVars : [
		'world'
	],
	#category : #GFCanvas
}

{ #category : #'as yet unclassified' }
GFCanvas3 >> drawPolygon3: obj [
	|v|
	self world local: obj local.
	v := obj vertices collect: [ :each | self world * each ].
	self drawLines: v
]

{ #category : #'as yet unclassified' }
GFCanvas3 >> drawPolyline3: obj [
	|v|
	self world local: obj local.
	v := obj vertices collect: [ :each | self world * each ].
	obj indices pairsDo: [ :one :two |
		self
			moveTo: (v at: one);
			lineTo: (v at: two)
	]
]

{ #category : #accessing }
GFCanvas3 >> focalLength: f [
	self world focalLength: f
]

{ #category : #'instance creation' }
GFCanvas3 >> from: pos [
	self world from: pos
]

{ #category : #'as yet unclassified' }
GFCanvas3 >> paper: paper [
	super paper: paper.
	self world
		width: paper width value;
		height: paper height value
]

{ #category : #accessing }
GFCanvas3 >> world [

	^ world ifNil: [ world := GFCamera new ]
]

{ #category : #accessing }
GFCanvas3 >> world: anObject [

	world := anObject
]
