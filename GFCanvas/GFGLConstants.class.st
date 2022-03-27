Class {
	#name : #GFGLConstants,
	#superclass : #SharedPool,
	#classVars : [
		'GL_COLOR_BUFFER_BIT'
	],
	#category : #GFCanvas
}

{ #category : #initialization }
GFGLConstants class >> initialize [
	GL_COLOR_BUFFER_BIT := 16r00004000.
]
