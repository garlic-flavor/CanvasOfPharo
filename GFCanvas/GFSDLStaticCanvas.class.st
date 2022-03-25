Class {
	#name : #GFSDLStaticCanvas,
	#superclass : #Object,
	#instVars : [
		'renderer',
		'window'
	],
	#category : #GFCanvas
}

{ #category : #factory }
GFSDLStaticCanvas >> createEventHandler [
	^ GFSDLCanvasEventHandler new
		canvas: self;
		yourself
]

{ #category : #initialization }
GFSDLStaticCanvas >> initializeWithRenderer [
]

{ #category : #'as yet unclassified' }
GFSDLStaticCanvas >> onDestroyEvent [
]

{ #category : #'instance creation' }
GFSDLStaticCanvas >> open [
	window := OSWindow createWithAttributes: (OSWindowAttributes new
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
GFSDLStaticCanvas >> present [
	renderer present
]

{ #category : #drawing }
GFSDLStaticCanvas >> redraw [
	^ self subclassResponsibility 
]

{ #category : #'instance creation' }
GFSDLStaticCanvas >> redrawAndPresent [
	self
		redraw;
		present
]
