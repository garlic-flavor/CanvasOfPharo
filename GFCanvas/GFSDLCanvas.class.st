Class {
	#name : #GFSDLCanvas,
	#superclass : #GFSDLCanvasBase,
	#category : #GFCanvas
}

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
