Class {
	#name : #GFGLCanvas,
	#superclass : #GFNativeCanvasBase,
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

{ #category : #accessing }
GFGLCanvas >> export [
	|reference surface pixels w h rw|
	reference := self class chooseFile.
	reference ifNil: [ ^ self ].
	w := window extent x.
	h := window extent y.
	surface := self class createSurface: window extent.
	pixels := SDL2 malloc: 3 * w * h.
	GFGL readPixelsX: 0 y: 0 w: w h: h
		format: GL_RGB type: GL_UNSIGNED_BYTE pixels: pixels.
	0 to: (h - 1) do: [ :i |
		SDL2 memcpy: pixels + (3 * w * (h - i - 1))
			to: surface pixels + (surface pitch * i)
			size: w * 3
	].
	SDL2 free: pixels.

	rw := SDL2 rwFromFile: reference fullName mode: 'wb'.
	surface saveBMP_RW: rw freedst: 1.

]

{ #category : #'path commands' }
GFGLCanvas >> lineTo: pos [
	GFGL
		begin: GL_LINES;
		color: self pen color;
		vertex2: self pen pos;
		vertex2: pos;
		end.
	self pen pos: pos.

]

{ #category : #'instance creation' }
GFGLCanvas >> open [
	window := OSWindowAnimated createWithAttributes: (OSWindowAttributes new
		extent: ((self paper width value)@(self paper height value));
		resizable: false;
		windowCentered: true;
		glAttributes: OSWindowGLAttributes new;
		yourself).
	renderer := window newOpenGLRenderer.
	renderer createContext.
	GFGL
		viewportX: 0 y: 0 w: self paper width value h: self paper height value;
		clearColor: self paper color;
		matrixMode: GL_PROJECTION;
		loadIdentity;
		orthoL: 0 r: self paper width value b: self paper height value t: 0 n: -1 f: 1;
		matrixMode: GL_MODELVIEW;
		loadIdentity.
	self initializeWithRenderer.
	window eventHandler: self createEventHandler.

]

{ #category : #rendering }
GFGLCanvas >> present [
	renderer swapBuffers: window backendWindow.

]
