Class {
	#name : #GFConcent,
	#superclass : #Object,
	#instVars : [
		'canvas',
		'center',
		'density',
		'doughnutHoleRadius'
	],
	#category : #'GFCanvas-Example'
}

{ #category : #'instance creation' }
GFConcent class >> new: paper center: center density: density hole: hole [
	^ self new
		canvas: (GFMorphCanvas new: paper);
		center: center;
		density: density;
		doughnutHoleRadius: hole;
		yourself
]

{ #category : #'instance creation' }
GFConcent class >> open: paper center: center density: density hole: hole [
	^ (self new: paper	center: center density: density hole: hole)
		open;
		yourself
]

{ #category : #adding }
GFConcent >> addLinesFrom: start to: end radius: radius [
	|step st en|
	
	step := Float twoPi / density.
	st := start // step.
	en := (end - step) // step.
	st to: en do: [:i ||p1 p2 c s|
		c := (step * i) cos.
		s := (step * i) sin.
		p1 := (doughnutHoleRadius * c)@(doughnutHoleRadius * s).
		p2 := (radius * c)@(radius * s).
		self canvas add: (GFLine2 start: (center + p1) end: (center + p2) ).
	]
]

{ #category : #accessing }
GFConcent >> canvas [

	^ canvas
]

{ #category : #accessing }
GFConcent >> canvas: anObject [

	canvas := anObject
]

{ #category : #accessing }
GFConcent >> center [

	^ center
]

{ #category : #accessing }
GFConcent >> center: anObject [

	center := anObject
]

{ #category : #accessing }
GFConcent >> density [

	^ density
]

{ #category : #accessing }
GFConcent >> density: anObject [

	density := anObject
]

{ #category : #accessing }
GFConcent >> doughnutHoleRadius [

	^ doughnutHoleRadius
]

{ #category : #accessing }
GFConcent >> doughnutHoleRadius: anObject [

	doughnutHoleRadius := anObject
]

{ #category : #'instance creation' }
GFConcent >> open [
	|rect radius|
	rect := Rectangle origin: 0@0 corner: (self canvas paper width value)@(self canvas paper height value).
	radius := (rect corners collect: [ :each | center distanceTo: each ]) max.
	(rect containsPoint: center) ifTrue: [
		self canvas add: (GFCross2 center: center width: 20).
		self addLinesFrom: 0 to: Float twoPi radius: radius.
	] ifFalse: [|angles startAngle endAngle|
		angles := rect corners collect: [ :each | (each - center) angle ].
		startAngle := angles min.
		endAngle := angles max.
		self addLinesFrom: startAngle to: endAngle radius: radius.
	].
	self canvas open
]
