Class {
	#name : #GFNativeCanvasBase,
	#superclass : #GFCanvasBase,
	#instVars : [
		'renderer',
		'window',
		'items'
	],
	#category : #'GFCanvas-SDL'
}

{ #category : #'as yet unclassified' }
GFNativeCanvasBase class >> chooseFile [
	^ UIManager default
		chooseForSaveFileReference: 'Save an image as BMP'
		extensions: { 'bmp' }
		path: ('screenshot', self identityHash asString, '.bmp')
	
]

{ #category : #'surface management' }
GFNativeCanvasBase class >> createSurface: size [
	^ (SDL2 createRGBSurface: 0
		width: size x height: size y depth: 24
		rmask: 16r000000ff
		gmask: 16r0000ff00
		bmask: 16r00ff0000
		amask: 16r00000000)
		autoRelease;
		yourself
]

{ #category : #adding }
GFNativeCanvasBase >> add: item [
	self items add: item.
	self redrawAndPresent.
]

{ #category : #accessing }
GFNativeCanvasBase >> circle: radius [
	|num step vert|
	num := 20.
	step := Float twoPi / (num - 1).
	vert := OrderedCollection new: num.
	1 to: num do: [ :i |
		vert add: (radius * (i cos)) @ (radius * (i sin))
	].
	self drawLines: vert
]

{ #category : #drawing }
GFNativeCanvasBase >> clear [
	^ self subclassResponsibility 
]

{ #category : #factory }
GFNativeCanvasBase >> createEventHandler [
	^ GFSDLCanvasEventHandler new
		canvas: self;
		yourself
]

{ #category : #'as yet unclassified' }
GFNativeCanvasBase >> ellipse: radius flattening: flattening [
	|num step vert|
	num := 20.
	step := Float twoPi / (num - 1).
	vert := OrderedCollection new: num.
	1 to: num do: [ :i |
		vert add: (radius * (i cos)) @ (radius * (i sin) * flattening)
	].
	self drawLines: vert

]

{ #category : #initialization }
GFNativeCanvasBase >> initializeWithRenderer [
]

{ #category : #accessing }
GFNativeCanvasBase >> items [

	^ items ifNil: [ items := OrderedCollection new ]
]

{ #category : #accessing }
GFNativeCanvasBase >> items: anObject [

	items := anObject
]

{ #category : #'as yet unclassified' }
GFNativeCanvasBase >> onDestroyEvent [
	renderer destroy.

]

{ #category : #'as yet unclassified' }
GFNativeCanvasBase >> onDrawEvent [
	OSWindowRenderThread enqueueOperation: [
		renderer ifNotNil: [ self redrawAndPresent ]
	]
]

{ #category : #'as yet unclassified' }
GFNativeCanvasBase >> onUpdateEvent: elapsed [
]

{ #category : #rendering }
GFNativeCanvasBase >> present [
	^ self subclassResponsibility 
]

{ #category : #drawing }
GFNativeCanvasBase >> redraw [
	self clear.
	self items do: [ :item | item drawOn: self ]

]

{ #category : #'instance creation' }
GFNativeCanvasBase >> redrawAndPresent [
	self
		redraw;
		present
]
