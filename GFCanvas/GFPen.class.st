"
holds pen like properties.
"
Class {
	#name : #GFPen,
	#superclass : #Object,
	#instVars : [
		'color',
		'width',
		'x',
		'y'
	],
	#category : #GFCanvas
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
GFPen >> width [

	^ width ifNil: [ width := GFUnit mm: 1 ]
]

{ #category : #accessing }
GFPen >> width: anObject [

	width := anObject
]

{ #category : #accessing }
GFPen >> x [

	^ x ifNil: [ x := GFUnit px: 0 ]
]

{ #category : #accessing }
GFPen >> x: anObject [

	x := anObject
]

{ #category : #accessing }
GFPen >> y [

	^ y ifNil: [ y := GFUnit px: 0 ]
]

{ #category : #accessing }
GFPen >> y: anObject [

	y := anObject
]
