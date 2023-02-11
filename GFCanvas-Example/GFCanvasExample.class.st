Class {
	#name : #GFCanvasExample,
	#superclass : #GFCanvasExampleBase,
	#category : #'GFCanvas-Example'
}

{ #category : #'as yet unclassified' }
GFCanvasExample >> _0001_line [
	self canvas
		moveTo: (1 cm)@(1 cm);
		lineTo: (15 cm) @ (10 cm);
		open
]

{ #category : #'as yet unclassified' }
GFCanvasExample >> _0002_chess [
	|square|
	square := (GFChess new: 1 w: 15 h: 10)
		local: (GFMatrix4x4 translateX: -10 y: -10 z: 0);
		yourself.
	self canvas
		focalLength: 50;
		from: (GFVector3 x: 2 y: -0 z: 50);
		add: square;
		open

]

{ #category : #'as yet unclassified' }
GFCanvasExample >> _0003_cube [
	|cube|
	cube := GFPolyline3 cube.
	self canvas
		focalLength: 50;
		from: (GFVector3 x: 5 y: 5 z: 10);
		add: cube;
		open

]

{ #category : #'as yet unclassified' }
GFCanvasExample >> _0004_circle [
	|circle|

	self canvas
		focalLength: 50;
		from: (GFVector3 x: 0 y: 0 z: 10).

	circle := GFPolygon3 circle
		local: (GFMatrix4x4 translateX: 0 y: -2.5 z: 0) *
			(GFMatrix4x4 rotate: Float pi / 2 axis: GFVector3 x);
		yourself.

	0 to: 15 do: [ :i |
		self canvas drawPolygon3: circle.
		circle local: (GFMatrix4x4 translateX: 0 y: 0.3 z: 0) * circle local.
	].

	self canvas open
]

{ #category : #'as yet unclassified' }
GFCanvasExample >> _0005_cropping [
	|line|
	self canvas pen width: 1.
	line := GFLine2 start: -100@100 end: 3000@200.
	line croppedBy: self canvas morph bounds.
	self canvas
		add: line;
		open

]

{ #category : #'as yet unclassified' }
GFCanvasExample >> _0006_chess_room [
	|s w h|
	s := 0.3.
	w := 20.
	h := 7.
	self canvas
		world: GFFishEye new;
		focalLength: 35;
		from: (GFVector3 x: 5 y: 1 z: 5.1) to: (GFVector3 x: 1 y: 1 z: 0);
		add: (GFChess new: s w: w h: h);
		add: ((GFChess new: s w: w h: h)
			local: (GFMatrix4x4 rotate: (Float halfPi * -1) axis: GFVector3 y);
			yourself);
		add: ((GFChess newShifted: s w: w h: w)
			local: (GFMatrix4x4 rotate: Float halfPi axis: GFVector3 x);
			yourself);
		add: ((GFChess newShifted: s w: w h: w)
			local: (GFMatrix4x4 translateX: 0 y: (s * h) z: 0) * 
				(GFMatrix4x4 rotate: Float halfPi axis: GFVector3 x);
			yourself);
		open

		
]

{ #category : #'as yet unclassified' }
GFCanvasExample >> _0007_roomA [
	|room|
	room := GFPolyline3 roomA: 10.
	room local: (GFMatrix4x4 scaleX: 1.5 y: 0.3 z: 1.5).
	self canvas
		focalLength: 50;
		from: (GFVector3 x: 2 y: -0 z: 3);
		penWidth: 1;
		drawPolyline3: room;
		open

]

{ #category : #'as yet unclassified' }
GFCanvasExample >> _0008_square [
	|square|
	square := (GFSquare3 new: 1 x: 0 y: 0)
		local: (GFMatrix4x4 translateX: -10 y: -10 z: 0);
		yourself.
	self canvas
		focalLength: 50;
		from: (GFVector3 x: 2 y: -0 z: 50);
		penWidth: 1;
		add: square;
		open

]

{ #category : #'as yet unclassified' }
GFCanvasExample >> _0009_concent [
	|line|
	line := GFPolyline2 concentAt: (5 cm)@(5 cm) density: 100 hole: 2 cm radius: 50 cm.
	self canvas
		add: line;
		open.
]
