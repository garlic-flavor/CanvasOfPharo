Class {
	#name : #GFExample,
	#superclass : #Object,
	#instVars : [
		'canvas',
		'paper',
		'from'
	],
	#category : #'GFCanvas-Example'
}

{ #category : #accessing }
GFExample >> canvas [

	^ canvas ifNil: [
		canvas := (self canvasClass new: self paper)
			focalLength: 50;
			from: self from;
			yourself
	]
]

{ #category : #accessing }
GFExample >> canvas: anObject [

	canvas := anObject
]

{ #category : #'as yet unclassified' }
GFExample >> canvasClass [
	^ GFMorphCanvas
]

{ #category : #'initialize-release' }
GFExample >> close [
	canvas ifNil: [ ^ self ].
	canvas close.
	canvas := nil

]

{ #category : #'initialize-release' }
GFExample >> export [
	canvas ifNil: [ ^ self ].
	canvas export.
]

{ #category : #accessing }
GFExample >> from [

	^ from ifNil: [ from := GFVector3 z: 10 ]
]

{ #category : #accessing }
GFExample >> from: anObject [

	from := anObject
]

{ #category : #'instance creation' }
GFExample >> open [
	self ready.
	^ self canvas open
]

{ #category : #accessing }
GFExample >> paper [

	^ paper ifNil: [ paper := GFPaper VGAyoko ]
]

{ #category : #accessing }
GFExample >> paper: anObject [

	paper := anObject
]

{ #category : #'as yet unclassified' }
GFExample >> ready [
]
