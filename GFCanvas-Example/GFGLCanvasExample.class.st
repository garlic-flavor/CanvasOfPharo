Class {
	#name : #GFGLCanvasExample,
	#superclass : #AnObsoleteGFGLCanvas,
	#instVars : [
		'angle'
	],
	#category : #'GFCanvas-Example'
}

{ #category : #'instance creation' }
GFGLCanvasExample >> open [
	angle := 0.
	super open.
	self
		focalLength: 50;
		from: (GFVector3 x: 5 y: 5 z: 10);
		add: GFPolyline3 cube
]

{ #category : #drawing }
GFGLCanvasExample >> redraw [
	super redraw.
"
	angle := (angle + 1) % 360.
	
	GFGL
		matrixMode: GL_MODELVIEW;
		loadIdentity;
		rotatef: angle x: 0 y: 0 z: 1;
		begin: GL_LINES;
		color: Color red;
		vertex2fX: 0 y: 0.5;
		vertex2fX: -0.5 y: 0;
		end.
	self moveTo: 0@0.
	self lineTo: 1@1.
"
]
