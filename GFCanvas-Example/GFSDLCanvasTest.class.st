Class {
	#name : #GFSDLCanvasTest,
	#superclass : #GFSDLStaticCanvas,
	#category : #'GFCanvas-Example'
}

{ #category : #drawing }
GFSDLCanvasTest >> redraw [
	renderer
		color: Color white;
		clear;
		color: Color blue;
		drawRectangle: (100@100 extent: 100@100)
]

{ #category : #actions }
GFSDLCanvasTest >> save [
	|surface texture rc rw|
	surface := SDL2 createRGBSurface: 0
		width: 640 height: 480 depth: 24
		rmask: 16r00ff0000
		gmask: 16r0000ff00
		bmask: 16r000000ff
		amask: 16r00000000.
	surface autoRelease.
	rc := SDL_Rect newX: 0 y: 0 w: 640 h: 480.

	texture := renderer getOrCreateRenderTargetTextureFor: #save withExtent: 640@480.
	surface lockSurface.
	renderer withRenderTarget: texture do: [
		self redraw.
		renderer readPixels: rc format: surface format format pixels: surface pixels pitch: surface pitch.
	].
	surface unlockSurface.
	rw := SDL2 rwFromFile: '/Users/giga/Documents/Pharo/images/test.bmp' mode: 'wb'.
	surface saveBMP_RW: rw freedst: 1.

]
