Class {
	#name : #GFGLConstants,
	#superclass : #SharedPool,
	#classVars : [
		'GL_BACK',
		'GL_COLOR_BUFFER_BIT',
		'GL_CULL_FACE',
		'GL_DEPTH_BUFFER_BIT',
		'GL_FLAT',
		'GL_FRONT',
		'GL_LINES',
		'GL_LINE_LOOP',
		'GL_LINE_STRIP',
		'GL_MODELVIEW',
		'GL_POINTS',
		'GL_POLYGON',
		'GL_PROJECTION',
		'GL_QUADS',
		'GL_QUAD_STRIP',
		'GL_SMOOTH',
		'GL_TEXTURE',
		'GL_TRIANGLES',
		'GL_TRIANGLE_FAN',
		'GL_TRIANGLE_STRIP'
	],
	#category : #'GFCanvas-OpenGL-Bindings'
}

{ #category : #initialization }
GFGLConstants class >> initialize [
	GL_COLOR_BUFFER_BIT := 16r00004000.
	GL_DEPTH_BUFFER_BIT := 16r00000100.
	
	GL_MODELVIEW  := 16r1700.
	GL_PROJECTION := 16r1701.
	GL_TEXTURE    := 16r1702.

	GL_POINTS         := 16r0000.
	GL_LINES          := 16r0001.
	GL_LINE_LOOP      := 16r0002.
	GL_LINE_STRIP     := 16r0003.
	GL_TRIANGLES      := 16r0004.
	GL_TRIANGLE_STRIP := 16r0005.
	GL_TRIANGLE_FAN   := 16r0006.
	GL_QUADS          := 16r0007.
	GL_QUAD_STRIP     := 16r0008.
	GL_POLYGON        := 16r0009.

	GL_FLAT   := 16r1D00.
	GL_SMOOTH := 16r1D01.

	GL_FRONT := 16r0404.
	GL_BACK  := 16r0405.
	
	GL_CULL_FACE := 16r0B44.


]
