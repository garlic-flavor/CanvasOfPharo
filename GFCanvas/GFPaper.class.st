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
	#category : #'GFCanvas-Base'
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
GFPaper class >> HDyoko [
	^ self new
		width: 1920 px;
		height: 1080 px;
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

{ #category : #converting }
GFPaper >> asRectangle [
	^ Rectangle origin: 0@0 corner: width@height
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
GFPaper >> extent [
	^ (self width)@(self height)
]

{ #category : #accessing }
GFPaper >> height [

	^ height ifNil: [ height := 480 ]
]

{ #category : #accessing }
GFPaper >> height: anObject [

	height := anObject
]

{ #category : #accessing }
GFPaper >> width [

	^ width ifNil: [ width := 640 ]
]

{ #category : #accessing }
GFPaper >> width: anObject [

	width := anObject

]
