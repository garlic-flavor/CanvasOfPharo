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
		'GLushort',
		'GLvoid'
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
	GLintptr := #intptr_t.
	GLsizeiptr := #intptr_t.
	GLsync := #intptr_t.
	GLbitfield := #uint32.
	GLhalf := #uint16.
	GLfloat := #float32.
	GLclampf := #float32.
	GLdouble := #float64.
	GLclampd := #float64.
	GLvoid := #void.

]
