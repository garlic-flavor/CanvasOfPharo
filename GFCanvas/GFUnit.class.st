"
GFUnit convert unit length.
"
Class {
	#name : #GFUnit,
	#superclass : #Object,
	#classInstVars : [
		'dpi',
		'prec'
	],
	#category : #'GFCanvas-Base'
}

{ #category : #accessing }
GFUnit class >> dpi [
	^ dpi ifNil: [ dpi := 300 ]
]

{ #category : #accessing }
GFUnit class >> dpi: newDpi [

	dpi := newDpi

]

{ #category : #'as yet unclassified' }
GFUnit class >> fromCm: centimeter [

	^ (centimeter * self dpi / 2.54) rounded
]

{ #category : #'instance creation' }
GFUnit class >> fromInch: inch [

	^ (inch * self dpi) rounded
]

{ #category : #'as yet unclassified' }
GFUnit class >> fromMm: millimeter [

	^ (millimeter * self dpi / 25.4) rounded
]

{ #category : #accessing }
GFUnit class >> prec [
	^ prec ifNil: [ prec := 1 ]
]

{ #category : #accessing }
GFUnit class >> prec: newPrecision [
	prec := newPrecision
]

{ #category : #accessing }
GFUnit class >> resetDPI [
	<script>
	dpi := nil
]

{ #category : #initialization }
GFUnit class >> resetPrecision [
	<script>
	prec := nil
]

{ #category : #'as yet unclassified' }
GFUnit class >> toCm: pixel [

	^ (pixel * 2.54 / self dpi * self prec) rounded / self prec
]

{ #category : #'instance creation' }
GFUnit class >> toInch: pixel [

	^ (pixel / self dpi * self prec) rounded / self prec
]

{ #category : #'as yet unclassified' }
GFUnit class >> toMm: pixel [

	^ (pixel * 25.4 / self dpi * self prec) rounded / self prec

]
