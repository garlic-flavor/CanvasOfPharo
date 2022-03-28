Class {
	#name : #GFGLCanvasExample,
	#superclass : #GFGLCanvas,
	#instVars : [
		'angle'
	],
	#category : #'GFCanvas-Example'
}

{ #category : #'instance creation' }
GFGLCanvasExample >> open [
	angle := 0.
	super open
]

{ #category : #drawing }
GFGLCanvasExample >> redraw [
	self clear.
	angle := (angle + 1) % 360.
	
	GFGL
		matrixMode: GL_MODELVIEW;
		loadIdentity;
		rotatef: angle x: 0 y: 0 z: 1;
		begin: GL_TRIANGLES;
		color: Color red;
		vertex3fX: 0 y: 0.5 z: 0;
		vertex3fX: -0.5 y: 0 z: 0;
		vertex3fX: 0.5 y: 0 z: 0;
		end

]
