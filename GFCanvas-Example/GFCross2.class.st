Class {
	#name : #GFCross2,
	#superclass : #Object,
	#instVars : [
		'center',
		'width'
	],
	#category : #'GFCanvas-Example'
}

{ #category : #accessing }
GFCross2 class >> center: center width: w [
	^ self new
		center: center;
		width: w;
		yourself.
]

{ #category : #accessing }
GFCross2 >> center [

	^ center
]

{ #category : #accessing }
GFCross2 >> center: anObject [

	center := anObject
]

{ #category : #accessing }
GFCross2 >> width [

	^ width
]

{ #category : #accessing }
GFCross2 >> width: anObject [

	width := anObject
]
