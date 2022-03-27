Class {
	#name : #GFGLCanvas,
	#superclass : #GFSDLCanvasBase,
	#pools : [
		'GFGLConstants'
	],
	#category : #GFCanvas
}

{ #category : #'as yet unclassified' }
GFGLCanvas >> onDrawEvent [
	GFGL clear: GL_COLOR_BUFFER_BIT.
]

{ #category : #'as yet unclassified' }
GFGLCanvas >> onUpdateEvent: elapsed [
]

{ #category : #'instance creation' }
GFGLCanvas >> open [
	window := OSWindowAnimated createWithAttributes: (OSWindowAttributes new
		extent: ((self paper width value)@(self paper height value));
		resizable: false;
		windowCentered: true;
		yourself).
	renderer := window newOpenGLRenderer.
	renderer createContext.
	renderer makeCurrent: window backendWindow.
	GFGL viewportX: 0 y: 0 w: self paper width value h: self paper height value.
	GFGL clearColor: self paper color.
	self initializeWithRenderer.
	window eventHandler: self createEventHandler.

]

{ #category : #rendering }
GFGLCanvas >> present [
	renderer swapBuffers: window backendWindow.
	renderer present.
]
