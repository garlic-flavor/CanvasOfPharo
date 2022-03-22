Class {
	#name : #GFCubeExample,
	#superclass : #Object,
	#category : #'GFCanvas-Example'
}

{ #category : #'as yet unclassified' }
GFCubeExample >> cube_01 [
	|canvas cube|
	canvas := (GFCanvas3 open: GFPaper VGAyoko)
		focalLength: 50;
		from: (GFVector3 x: 5 y: 5 z: 10);
		yourself.
	cube := GFPolyline3 cube.
	canvas drawPolyline3: cube.

]
