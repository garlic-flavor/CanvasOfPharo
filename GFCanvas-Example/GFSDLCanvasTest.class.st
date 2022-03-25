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
		color: Color black;
		drawRectangle: (100@100 extent: 100@100)
]

{ #category : #actions }
GFSDLCanvasTest >> save [
	|surface rw|
	surface := window backendWindow sdl2Window getWindowSurface.
	rw := SDL2 rwFromFile: '/Users/giga/Documents/Pharo/images/test.bmp' mode: 'wb'.
	surface saveBMP_RW: rw freedst: 1.
	
]
