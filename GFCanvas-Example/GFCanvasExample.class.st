Class {
	#name : #GFCanvasExample,
	#superclass : #Object,
	#category : #'GFCanvas-Example'
}

{ #category : #'as yet unclassified' }
GFCanvasExample >> circle_01 [
	|canvas circle|
	canvas := (GFCanvas3 open: GFPaper VGAyoko)
		focalLength: 50;
		from: (GFVector3 x: 0 y: 0 z: 10);
		yourself.
	circle := GFPolygon3 circle.
	circle local: (GFMatrix4x4 translateX: 0 y: -2.5 z: 0) *
		(GFMatrix4x4 rotate: Float pi / 2 axis: GFVector3 x).

	0 to: 15 do: [ :i |
		canvas drawPolygon3: circle.
		circle local: (GFMatrix4x4 translateX: 0 y: 0.3 z: 0) * circle local.
	]
]

{ #category : #'as yet unclassified' }
GFCanvasExample >> cube_01 [
	|canvas cube|
	canvas := (GFCanvas3 open: GFPaper VGAyoko)
		focalLength: 50;
		from: (GFVector3 x: 5 y: 5 z: 10);
		yourself.
	cube := GFPolyline3 cube.
	canvas drawPolyline3: cube.

]

{ #category : #'as yet unclassified' }
GFCanvasExample >> roomA_01 [
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