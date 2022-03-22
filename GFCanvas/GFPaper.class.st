"
represent paper size in GFUnit.
"
Class {
	#name : #GFPaper,
	#superclass : #Object,
	#instVars : [
		'width',
		'height',
		'color'
	],
	#category : #GFCanvas
}

{ #category : #'as yet unclassified' }
GFPaper class >> A4tate [
	^ self new
		width: 210 mm;
		height: 297 mm;
		yourself

]

{ #category : #'as yet unclassified' }
GFPaper class >> A4yoko [
	^ self new
		width: 297 mm;
		height: 210 mm;
		yourself

]

{ #category : #'as yet unclassified' }
GFPaper class >> B4tate [
	^ self new
		width: 257 mm;
		height: 364 mm;
		yourself
]

{ #category : #'as yet unclassified' }
GFPaper class >> B4yoko [
	^ self new
		width: 364 mm;
		height: 257 mm;
		yourself
]

{ #category : #'as yet unclassified' }
GFPaper class >> B5tate [
	^ self new
		width: 182 mm;
		height: 257 mm;
		yourself
]

{ #category : #'as yet unclassified' }
GFPaper class >> B5yoko [
	^ self new
		width: 257 mm;
		height: 182 mm;
		yourself
]

{ #category : #'as yet unclassified' }
GFPaper class >> VGAyoko [
	^ self new
		width: 640 px;
		height: 480 px;
		yourself
]

{ #category : #'instance creation' }
GFPaper class >> width: w height: h [
	^ self new
		width: w;
		height: h;
		yourself
]

{ #category : #accessing }
GFPaper >> color [

	^ color ifNil: [ color := Color white ]
]

{ #category : #accessing }
GFPaper >> color: anObject [

	color := anObject
]

{ #category : #accessing }
GFPaper >> dpi [
	^ self height dpi
]

{ #category : #accessing }
GFPaper >> dpi: newDpi [
	self height dpi: newDpi.
	self width dpi: newDpi.
]

{ #category : #accessing }
GFPaper >> height [

	^ height ifNil: [ height := GFUnit new ]
]

{ #category : #accessing }
GFPaper >> height: anObject [

	height := anObject
]

{ #category : #accessing }
GFPaper >> width [

	^ width ifNil: [ width := GFUnit new ]
]

{ #category : #accessing }
GFPaper >> width: anObject [

	width := anObject
]
