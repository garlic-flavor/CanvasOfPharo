Class {
	#name : #GFSDLCanvas,
	#superclass : #Object,
	#instVars : [
		'renderer',
		'window'
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
	window := OSWindowAnimated createWithAttributes: (OSWindowAttributes new
		extent: 640@480;
		resizable: false;
		windowCentered: true;
		yourself).
	renderer := window newGenericRenderer.
	self initializeWithRenderer.
	window eventHandler: self createEventHandler.

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
	self
		redraw;
		present
]
