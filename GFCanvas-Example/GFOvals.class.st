Class {
	#name : #GFOvals,
	#superclass : #Object,
	#instVars : [
		'center',
		'radius',
		'num',
		'minimumFlattening',
		'cross',
		'crossSize'
	],
	#category : #'GFCanvas-Example'
}

{ #category : #accessing }
GFOvals >> center [

	^ center ifNil: [
		center := 100@100
	]
]

{ #category : #accessing }
GFOvals >> center: anObject [

	center := anObject
]

{ #category : #accessing }
GFOvals >> cross [

	^ cross ifNil: [
		cross := GFCross2 center: self center width: self crossSize.
	]
]

{ #category : #accessing }
GFOvals >> cross: anObject [

	cross := anObject
]

{ #category : #accessing }
GFOvals >> crossSize [

	^ crossSize ifNil: [ crossSize := 10 ]
]

{ #category : #accessing }
GFOvals >> crossSize: anObject [

	crossSize := anObject
]

{ #category : #drawing }
GFOvals >> drawOn: canvas [
	|step|
	step := (1.0 - self minimumFlattening) / (self num - 1).
	self cross drawOn: canvas.
	0 to: self num do: [ :i |
		canvas moveTo: self center.
		canvas ellipse: self radius flattening: (1.0 - (step * i))
	]
]

{ #category : #accessing }
GFOvals >> minimumFlattening [

	^ minimumFlattening ifNil: [ minimumFlattening := 0.1 ]
]

{ #category : #accessing }
GFOvals >> minimumFlattening: anObject [

	minimumFlattening := anObject
]

{ #category : #accessing }
GFOvals >> num [

	^ num ifNil: [ num := 10 ]
]

{ #category : #accessing }
GFOvals >> num: anObject [

	num := anObject
]

{ #category : #accessing }
GFOvals >> radius [

	^ radius ifNil: [ radius := 100 ]
]

{ #category : #accessing }
GFOvals >> radius: anObject [

	radius := anObject
]
