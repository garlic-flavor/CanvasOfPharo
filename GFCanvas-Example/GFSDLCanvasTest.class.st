Class {
	#name : #GFSDLCanvasTest,
	#superclass : #GFSDLCanvas,
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