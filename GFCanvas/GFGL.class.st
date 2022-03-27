Class {
	#name : #GFGL,
	#superclass : #Object,
	#pools : [
		'GFGLConstants',
		'GFGLTypes'
	],
	#category : #'GFCanvas-OpenGL-Bindings'
}

{ #category : #public }
GFGL class >> clear: mask [
	^ self ffiCall: #( void glClear ( GLbitfield mask ) )
	
]

{ #category : #'as yet unclassified' }
GFGL class >> clearColor: color [
	self clearColorR: color red g: color green b: color blue a: color alpha
]

{ #category : #'as yet unclassified' }
GFGL class >> clearColorR: r g: g b: b a: a [
	^ self ffiCall: #( void glClearColor (
		GLclampf r, GLclampf g, GLclampf b, GLclampf a ))
]

{ #category : #'library path' }
GFGL class >> ffiLibraryName [
	self flag: #toImplement.
	^ #OpenGL
]

{ #category : #'as yet unclassified' }
GFGL class >> viewportX: x y: y w: w h: h [
	^ self ffiCall: #( void glViewport (
		GLint x, GLint y, GLsizei w, GLsizei h ) )
]

{ #category : #'library path' }
GFGL >> ffiLibraryName [
	^ self class ffiLibraryName
]
