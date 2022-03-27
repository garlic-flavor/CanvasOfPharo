Class {
	#name : #GFGLTypes,
	#superclass : #SharedPool,
	#classVars : [
		'GLbitfield',
		'GLboolean',
		'GLbyte',
		'GLclampd',
		'GLclampf',
		'GLdouble',
		'GLenum',
		'GLfixed',
		'GLfloat',
		'GLhalf',
		'GLint',
		'GLint64',
		'GLintptr',
		'GLshort',
		'GLsizei',
		'GLsizeiptr',
		'GLsync',
		'GLubyte',
		'GLuint',
		'GLuint64',
		'GLushort'
	],
	#category : #'GFCanvas-OpenGL-Bindings'
}

{ #category : #initialization }
GFGLTypes class >> initialize [
	GLboolean := #uint8. 
	GLbyte := #int8.
	GLubyte := #uint8.
	GLshort := #int16.
	GLushort := #uint16.
	GLint := #int32.
	GLuint := #uint32.	
	GLfixed := #int32.
	GLint64 := #int64.
	GLuint64 := #uint64.
	GLsizei := #uint32.
	GLenum := #int32.
	GLintptr := #intptr_t. self flag: #fixme.
	GLsizeiptr := #intptr_t. self flag: #fixme.
	GLsync := #intptr_t. self flag: #fixme.
	GLbitfield := #uint32.
	GLhalf := #uint16.
	GLfloat := #float.
	GLclampf := #float.
	GLdouble := #double.
	GLclampf := #double.

]
