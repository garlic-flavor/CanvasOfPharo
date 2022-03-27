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
		'GL_MODELVIEW',
		'GL_PROJECTION',
		'GL_SMOOTH',
		'GL_TEXTURE'
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

	GL_FLAT   := 16r1D00.
	GL_SMOOTH := 16r1D01.

	GL_FRONT := 16r0404.
	GL_BACK  := 16r0405.
	
	GL_CULL_FACE := 16r0B44.


]
