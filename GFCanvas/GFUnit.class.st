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
	#category : #GFCanvas
}

{ #category : #'as yet unclassified' }
GFUnit class >> cm: centimeter [
	^ self new
		cm: centimeter;
		yourself
]

{ #category : #'instance creation' }
GFUnit class >> in: inch [
	^ self new
		in: inch;
		yourself
]

{ #category : #'as yet unclassified' }
GFUnit class >> mm: millimeter [
	^ self new
		mm: millimeter;
		yourself
]

{ #category : #'as yet unclassified' }
GFUnit class >> px: px [
	^ self new
		pixel: px;
		yourself
]

{ #category : #'as yet unclassified' }
GFUnit >> cm [
	^ self mm * 0.1
	
]

{ #category : #'as yet unclassified' }
GFUnit >> cm: centimeter [
	self px: centimeter * self dpi / 2.54
	
]

{ #category : #accessing }
GFUnit >> dpi [

	^ dpi ifNil: [ dpi := 300 ]
]

{ #category : #accessing }
GFUnit >> dpi: anObject [

	dpi := anObject
]

{ #category : #'instance creation' }
GFUnit >> in [
	^ self px / self dpi
]

{ #category : #'instance creation' }
GFUnit >> in: inch [
	self px: inch * self dpi
]

{ #category : #'as yet unclassified' }
GFUnit >> mm [
	^ (self px * 25.4 / self dpi) asInteger
	
]

{ #category : #'as yet unclassified' }
GFUnit >> mm: millimeter [
	self px: millimeter * self dpi / 25.4
	
]

{ #category : #accessing }
GFUnit >> px [

	^ pixel ifNil: [ pixel := 0 ]
]

{ #category : #accessing }
GFUnit >> px: anObject [

	pixel := anObject asInteger
]
