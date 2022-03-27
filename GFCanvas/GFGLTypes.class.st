Class {
	#name : #GFGLTypes,
	#superclass : #SharedPool,
	#classVars : [
		'GLbitfield',
		'GLclampf',
		'GLint',
		'GLsizei'
	],
	#category : #GFCanvas
}

{ #category : #initialization }
GFGLTypes class >> initialize [
	GLint := #int32.
	GLsizei := #uint32.
	GLclampf := #float32.
	GLbitfield := #uint32.
]
