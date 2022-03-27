"
holds pen like properties.
"
Class {
	#name : #GFPen,
	#superclass : #Object,
	#instVars : [
		'color',
		'width',
		'pos'
	],
	#category : #'GFCanvas-Base'
}

{ #category : #accessing }
GFPen >> color [

	^ color ifNil: [ color := Color black ]
]

{ #category : #accessing }
GFPen >> color: anObject [

	color := anObject
]

{ #category : #accessing }
GFPen >> pos [

	^ pos ifNil: [ 0@0 ]
]

{ #category : #accessing }
GFPen >> pos: anObject [

	pos := anObject
]

{ #category : #accessing }
GFPen >> width [

	^ width ifNil: [ width := GFUnit px: 1 ]
]

{ #category : #accessing }
GFPen >> width: anObject [

	width := anObject
]
