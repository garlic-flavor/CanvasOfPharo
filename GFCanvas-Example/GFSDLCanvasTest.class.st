Class {
	#name : #GFSDLCanvasTest,
	#superclass : #GFSDLStaticCanvas,
	#category : #'GFCanvas-Example'
}

{ #category : #navigating }
GFSDLCanvasTest >> go [
	self paper: GFPaper VGAyoko.
	self open.
]

{ #category : #drawing }
GFSDLCanvasTest >> redraw [
	renderer
		color: self paper color;
		clear;
		color: self pen color;
		drawRectangle: (100@100 extent: 100@100)
]
