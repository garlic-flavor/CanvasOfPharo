"
GFUnit convert unit length.
"
Class {
	#name : #GFUnit,
	#superclass : #Object,
	#classInstVars : [
		'dpi'
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

	^ centimeter * self dpi / 2.54
]

{ #category : #'instance creation' }
GFUnit class >> fromInch: inch [

	^ inch * self dpi
]

{ #category : #'as yet unclassified' }
GFUnit class >> fromMm: millimeter [

	^ millimeter * self dpi / 25.4
]

{ #category : #accessing }
GFUnit class >> resetDefaultDPI [
	<script>
	dpi := nil
]

{ #category : #'as yet unclassified' }
GFUnit class >> toCm: pixel [

	^ pixel * 2.54 / self dpi
]

{ #category : #'instance creation' }
GFUnit class >> toInch: pixel [

	^ pixel / self dpi
]

{ #category : #'as yet unclassified' }
GFUnit class >> toMm: pixel [

	^ pixel * 25.4 / self dpi

]
