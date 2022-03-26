Class {
	#name : #GFSDLStaticCanvas,
	#superclass : #GFSDLCanvasBase,
	#category : #GFCanvas
}

{ #category : #'as yet unclassified' }
GFSDLStaticCanvas >> onDestroyEvent [
]

{ #category : #'instance creation' }
GFSDLStaticCanvas >> open [
	window := OSWindow createWithAttributes: (OSWindowAttributes new
		extent: (self paper width value @ self paper height value);
		resizable: false;
		windowCentered: true;
		yourself).
	renderer := window newGenericRenderer.
	self initializeWithRenderer.
	window eventHandler: self createEventHandler.
	self redrawAndPresent.
]
