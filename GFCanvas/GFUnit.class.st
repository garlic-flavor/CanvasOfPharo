"
GFUnit convert unit length.
"
Class {
	#name : #GFUnit,
	#superclass : #Object,
	#instVars : [
		'pixel'
	],
	#classInstVars : [
		'dpi'
	],
	#category : #'GFCanvas-Base'
}

{ #category : #'instance creation' }
GFUnit class >> cm: centimeter [
	^ self new
		cm: centimeter;
		yourself

]

{ #category : #accessing }
GFUnit class >> dpi [
	^ dpi ifNil: [ dpi := 300 ]
]

{ #category : #accessing }
GFUnit class >> dpi: newDpi [

	self allInstancesDo: [ :one | one px: one value * newDpi / self dpi ].
	dpi := newDpi

]

{ #category : #'instance creation' }
GFUnit class >> inch: inch [
	^ self new
		inch: inch;
		yourself

]

{ #category : #'instance creation' }
GFUnit class >> mm: millimeter [
	^ self new
		mm: millimeter;
		yourself

]

{ #category : #'instance creation' }
GFUnit class >> px: px [
	^ self new
		px: px;
		yourself

]

{ #category : #accessing }
GFUnit class >> resetDefaultDPI [
	<script>
	dpi := nil
]

{ #category : #operations }
GFUnit >> @ y [
	^ Point x: self value y: y value
]

{ #category : #'as yet unclassified' }
GFUnit >> cm: centimeter [
	self px: centimeter * self class dpi / 2.54
	
]

{ #category : #'as yet unclassified' }
GFUnit >> inCm [
	^ self inMm * 0.1
	
]

{ #category : #'instance creation' }
GFUnit >> inInch [
	^ pixel / self class dpi
]

{ #category : #'as yet unclassified' }
GFUnit >> inMm [
	^ (pixel * 25.4 / self class dpi) asInteger
	
]

{ #category : #'instance creation' }
GFUnit >> inch: inch [
	self px: inch * self class dpi
]

{ #category : #'as yet unclassified' }
GFUnit >> mm: millimeter [
	self px: millimeter * self class dpi / 25.4
	
]

{ #category : #accessing }
GFUnit >> pixel [
	^ pixel
]

{ #category : #accessing }
GFUnit >> pixel: anObject [

	^ pixel := anObject
]

{ #category : #accessing }
GFUnit >> px: anObject [

	pixel := anObject asInteger
]

{ #category : #accessing }
GFUnit >> value [
	^ pixel
]
