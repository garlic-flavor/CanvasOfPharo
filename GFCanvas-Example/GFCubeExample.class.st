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

{ #category : #'as yet unclassified' }
GFCubeExample >> roomA_01 [
	|canvas room|
	canvas := (GFCanvas3 open: GFPaper VGAyoko)
		focalLength: 50;
		from: (GFVector3 x: 2 y: -0 z: 3);
		yourself.
	canvas pen width: 1.
	room := GFPolyline3 roomA: 10.
	room local: (GFMatrix4x4 scaleX: 1.5 y: 0.3 z: 1.5).
	canvas drawPolyline3: room.

]
