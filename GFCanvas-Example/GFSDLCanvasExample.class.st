Class {
	#name : #GFSDLCanvasExample,
	#superclass : #Object,
	#instVars : [
		'canvas'
	],
	#category : #'GFCanvas-Example'
}

{ #category : #'as yet unclassified' }
GFSDLCanvasExample >> cube_01 [
	|cube|
	canvas := (GFSDLStaticCanvas open: GFPaper VGAyoko)
		focalLength: 50;
		from: (GFVector3 x: 5 y: 5 z: 10);
		yourself.
	cube := GFPolyline3 cube.
	canvas add: cube.

]

{ #category : #navigating }
GFSDLCanvasExample >> test_01 [
	canvas := (GFSDLStaticCanvas open: GFPaper VGAyoko).
	canvas
		clear;
		moveTo: 50@40;
		lineTo: 100@200;
		present

]
