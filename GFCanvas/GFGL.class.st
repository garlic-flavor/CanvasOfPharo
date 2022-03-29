Class {
	#name : #GFGL,
	#superclass : #Object,
	#pools : [
		'GFGLConstants',
		'GFGLTypes'
	],
	#category : #'GFCanvas-OpenGL-Bindings'
}

{ #category : #'as yet unclassified' }
GFGL class >> begin: mode [
	^ self ffiCall: #( void glBegin ( GLenum mode ) )
]

{ #category : #public }
GFGL class >> clear: mask [
	^ self ffiCall: #( void glClear ( GLbitfield mask ) )
	
]

{ #category : #'as yet unclassified' }
GFGL class >> clearColor: color [
	self clearColorR: color red g: color green b: color blue a: color alpha
]

{ #category : #'as yet unclassified' }
GFGL class >> clearColorR: red g: green b: blue a: alpha [
	^ self ffiCall: #(void glClearColor(
	   GLclampf red,
	   GLclampf green,
	   GLclampf blue,
	   GLclampf alpha
	) )
]

{ #category : #'as yet unclassified' }
GFGL class >> color4fR: red g: green b: blue a: alpha [
	^ self ffiCall: #( void glColor4f ( 
		GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha ) )
]

{ #category : #accessing }
GFGL class >> color: color [
	^ self color4fR: color red g: color green b: color blue a: color alpha
]

{ #category : #accessing }
GFGL class >> end [
	^ self ffiCall: #( void glEnd ( ) )
]

{ #category : #'library path' }
GFGL class >> ffiLibraryName [
	self flag: #toImplement.
	^ #OpenGL
]

{ #category : #transformations }
GFGL class >> loadIdentity [
	^ self ffiCall: #( void glLoadIdentity () )
]

{ #category : #'as yet unclassified' }
GFGL class >> matrixMode: mode [
	^ self ffiCall: #( void glMatrixMode ( GLenum mode ) )
]

{ #category : #'as yet unclassified' }
GFGL class >> orthoL: left r: right b: bottom t: top n: near f: far [
	^ self ffiCall: #( void glOrtho(
	GLdouble left,
 	GLdouble right,
 	GLdouble bottom,
 	GLdouble top,
 	GLdouble near,
 	GLdouble far) )
 
]

{ #category : #'as yet unclassified' }
GFGL class >> readPixelsX: x y: y w: w h: h format: fmt type: type pixels: pixels [
	^ self ffiCall: #( void glReadPixels (
	   GLint   x,
	   GLint   y,
	   GLsizei w,
	   GLsizei h,
	   GLenum  fmt,
	   GLenum  type,
	   GLvoid* pixels
	) )
]

{ #category : #'as yet unclassified' }
GFGL class >> rotatef: angle x: x y: y z: z [
	^ self ffiCall: #( void glRotatef (
		GLfloat angle, GLfloat x, GLfloat y, GLfloat z ) )
]

{ #category : #'as yet unclassified' }
GFGL class >> translatefX: x y: y z: z [
	^ self ffiCall: #( void glTranslatef ( GLfloat x, GLfloat y, GLfloat z ) )
]

{ #category : #accessing }
GFGL class >> vertex2: v [
	^ self vertex2fX: v x y: v y
]

{ #category : #'as yet unclassified' }
GFGL class >> vertex2fX: x y: y [
	^ self ffiCall: #( void glVertex3f (
		GLfloat x, GLfloat y  ) )
]

{ #category : #accessing }
GFGL class >> vertex3: v [
	^ self vertex3fX: v x y: v y z: v z
]

{ #category : #'as yet unclassified' }
GFGL class >> vertex3fX: x y: y z: z [
	^ self ffiCall: #( void glVertex3f (
		GLfloat x, GLfloat y, GLfloat z ) )
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
