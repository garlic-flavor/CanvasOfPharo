"
GFUnit convert unit length.
"
Class {
	#name : #GFUnit,
	#superclass : #Object,
	#instVars : [
		'dpi',
		'pixel'
	],
	#classInstVars : [
		'defaultDPI'
	],
	#category : #'GFCanvas-Base'
}

{ #category : #'instance creation' }
GFUnit class >> cm: centimeter [
	^ self cm: centimeter dpi: self defaultDPI

]

{ #category : #'instance creation' }
GFUnit class >> cm: centimeter dpi: dpi [
	^ self new
		dpi: dpi;
		cm: centimeter;
		yourself
]

{ #category : #accessing }
GFUnit class >> defaultDPI [
	^ defaultDPI ifNil: [ defaultDPI := 300 ]
]

{ #category : #'instance creation' }
GFUnit class >> in: inch [
	^ self in: inch dpi: self defaultDPI

]

{ #category : #'instance creation' }
GFUnit class >> in: inch dpi: dpi [
	^ self new
		dpi: dpi;
		in: inch;
		yourself
]

{ #category : #'instance creation' }
GFUnit class >> mm: millimeter [
	^ self mm: millimeter dpi: self defaultDPI

]

{ #category : #'instance creation' }
GFUnit class >> mm: millimeter dpi: dpi [
	^ self new
		dpi: dpi;
		mm: millimeter;
		yourself
]

{ #category : #'instance creation' }
GFUnit class >> px: px [
	^ self px: px dpi: self defaultDPI

]

{ #category : #'instance creation' }
GFUnit class >> px: px dpi: dpi [
	^ self new
		dpi: dpi;
		px: px;
		yourself
]

{ #category : #accessing }
GFUnit class >> resetDefaultDPI [
	<script>
	defaultDPI := nil
]

{ #category : #operations }
GFUnit >> @ y [
	^ Point x: self value y: y value
]

{ #category : #'as yet unclassified' }
GFUnit >> cm: centimeter [
	self px: centimeter * self dpi / 2.54
	
]

{ #category : #accessing }
GFUnit >> dpi [

	^ dpi ifNil: [ dpi := self class defaultDPI ]
]

{ #category : #accessing }
GFUnit >> dpi: anObject [

	pixel ifNotNil: [ pixel := pixel * anObject / dpi ].
	dpi := anObject
]

{ #category : #'instance creation' }
GFUnit >> in: inch [
	self px: inch * self dpi
]

{ #category : #'as yet unclassified' }
GFUnit >> inCm [
	^ self inMm * 0.1
	
]

{ #category : #'instance creation' }
GFUnit >> inInch [
	^ pixel / self dpi
]

{ #category : #'as yet unclassified' }
GFUnit >> inMm [
	^ (pixel * 25.4 / self dpi) asInteger
	
]

{ #category : #'as yet unclassified' }
GFUnit >> mm: millimeter [
	self px: millimeter * self dpi / 25.4
	
]

{ #category : #accessing }
GFUnit >> px: anObject [

	pixel := anObject asInteger
]

{ #category : #accessing }
GFUnit >> value [
	^ pixel
]
