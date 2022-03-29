Class {
	#name : #GFCanvasExample,
	#superclass : #Object,
	#instVars : [
		'canvas'
	],
	#category : #'GFCanvas-Example'
}

{ #category : #'as yet unclassified' }
GFCanvasExample >> chess_01 [
	|square|
	canvas := (GFMorphCanvas open: GFPaper VGAyoko)
		focalLength: 50;
		from: (GFVector3 x: 2 y: -0 z: 50);
		yourself.
	canvas pen width: 1.
	square := (GFChess new: 1 w: 4 h: 5)
		local: (GFMatrix4x4 translateX: -10 y: -10 z: 0);
		yourself.
	canvas add: square.

]

{ #category : #'as yet unclassified' }
GFCanvasExample >> chess_room_01 [
	|s w h|
	s := 0.3.
	w := 20.
	h := 7.
	canvas := GFMorphCanvas new
		world: GFFishEye new;
		paper: GFPaper VGAyoko;
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
		open;
		yourself
		
]

{ #category : #'as yet unclassified' }
GFCanvasExample >> circle_01 [
	|circle|
	canvas := (GFMorphCanvas open: GFPaper VGAyoko)
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

{ #category : #'initialize-release' }
GFCanvasExample >> close [
	canvas ifNil: [ ^ self ].
	canvas close.
	canvas := nil.
]

{ #category : #'as yet unclassified' }
GFCanvasExample >> cube_01 [
	|cube|
	canvas := (GFMorphCanvas open: GFPaper VGAyoko)
		focalLength: 50;
		from: (GFVector3 x: 5 y: 5 z: 10);
		yourself.
	cube := GFPolyline3 cube.
	canvas add: cube.

]

{ #category : #'as yet unclassified' }
GFCanvasExample >> grid_01 [
	|grid|
	canvas := (GFMorphCanvas open: GFPaper VGAyoko)
		focalLength: 50;
		from: (GFVector3 x: 5 y: 5 z: 10);
		yourself.
	grid := GFPolyline3 grid: 0.3 w: 5 h: 3.
	canvas add: grid.

]

{ #category : #'as yet unclassified' }
GFCanvasExample >> grid_02 [
	canvas := (GFMorphCanvas open: GFPaper VGAyoko)
		focalLength: 50;
		from: (GFVector3 x: 5 y: 5 z: 10);
		yourself.
	canvas add: (GFRoomType1 size: 0.5 w: 5 h: 3 d: 4).
]

{ #category : #'as yet unclassified' }
GFCanvasExample >> roomA_01 [
	|room|
	canvas := (GFMorphCanvas open: GFPaper VGAyoko)
		focalLength: 50;
		from: (GFVector3 x: 2 y: -0 z: 3);
		yourself.
	canvas pen width: 1.
	room := GFPolyline3 roomA: 10.
	room local: (GFMatrix4x4 scaleX: 1.5 y: 0.3 z: 1.5).
	canvas drawPolyline3: room.

]

{ #category : #'as yet unclassified' }
GFCanvasExample >> square_01 [
	|square|
	canvas := (GFMorphCanvas open: GFPaper VGAyoko)
		focalLength: 50;
		from: (GFVector3 x: 2 y: -0 z: 50);
		yourself.
	canvas pen width: 1.
	square := (GFSquare3 new: 1 x: 0 y: 0)
		local: (GFMatrix4x4 translateX: -10 y: -10 z: 0);
		yourself.
	canvas add: square.

]
