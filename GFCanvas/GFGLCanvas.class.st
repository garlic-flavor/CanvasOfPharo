Class {
	#name : #GFGLCanvas,
	#superclass : #GFSDLCanvasBase,
	#pools : [
		'GFGLConstants',
		'SDL2Constants'
	],
	#category : #'GFCanvas-OpenGL'
}

{ #category : #accessing }
GFGLCanvas >> clear [
	GFGL clear: GL_COLOR_BUFFER_BIT.
]

{ #category : #'as yet unclassified' }
GFGLCanvas >> onDestroyEvent [
	renderer destroy
]

{ #category : #'instance creation' }
GFGLCanvas >> open [
	window := OSWindow createWithAttributes: (OSWindowAttributes new
		extent: ((self paper width value)@(self paper height value));
		resizable: false;
		windowCentered: true;
		glAttributes: OSWindowGLAttributes new;
		yourself).
	renderer := window newOpenGLRenderer.
	renderer createContext.
	renderer makeCurrent.
	GFGL viewportX: 0 y: 0 w: 640 h: 480.
	GFGL clearColorR: 1.0 g: 1.0 b: 1.0 a: 1.0.
"
	GFGL clearColor: self paper color.
"
""
	GFGL clear: GL_COLOR_BUFFER_BIT.
	renderer swapBuffers.
""
	self initializeWithRenderer.
	window eventHandler: self createEventHandler.

]

{ #category : #rendering }
GFGLCanvas >> present [
	renderer swapBuffers: window backendWindow.

]
