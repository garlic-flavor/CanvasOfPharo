Class {
	#name : #GFSDLCanvas,
	#superclass : #GFSDLCanvasBase,
	#category : #'GFCanvas-SDL'
}

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
