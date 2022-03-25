Class {
	#name : #GFSDLCanvas,
	#superclass : #Object,
	#instVars : [
		'renderer',
		'window',
		'counter'
	],
	#category : #GFCanvas
}

{ #category : #factory }
GFSDLCanvas >> createEventHandler [
	^ GFSDLCanvasEventHandler new
		canvas: self;
		yourself
]

{ #category : #initialization }
GFSDLCanvas >> initializeWithRenderer [
]

{ #category : #'as yet unclassified' }
GFSDLCanvas >> onDestroyEvent [
]

{ #category : #'as yet unclassified' }
GFSDLCanvas >> onDrawEvent [
	OSWindowRenderThread enqueueOperation: [
		renderer ifNotNil: [ self redrawAndPresent ]
	]
]

{ #category : #'as yet unclassified' }
GFSDLCanvas >> onUpdateEvent: elapsed [
]

{ #category : #'instance creation' }
GFSDLCanvas >> open [
	counter := 0.
	window := OSWindowAnimated createWithAttributes: (OSWindowAttributes new
		extent: 640@480;
		resizable: false;
		windowCentered: true;
		yourself).
	renderer := window newGenericRenderer.
	self initializeWithRenderer.
	window eventHandler: self createEventHandler.
	self redrawAndPresent.
]

{ #category : #rendering }
GFSDLCanvas >> present [
	renderer present
]

{ #category : #drawing }
GFSDLCanvas >> redraw [
	^ self subclassResponsibility 
]

{ #category : #'instance creation' }
GFSDLCanvas >> redrawAndPresent [
	counter := counter + 1.
	self
		redraw;
		present
]
