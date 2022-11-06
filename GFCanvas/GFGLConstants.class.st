Class {
	#name : #GFGLConstants,
	#superclass : #SharedPool,
	#classVars : [
		'GL_2_BYTES',
		'GL_3_BYTES',
		'GL_4_BYTES',
		'GL_ALPHA',
		'GL_BACK',
		'GL_BLUE',
		'GL_BYTE',
		'GL_COLOR_BUFFER_BIT',
		'GL_COLOR_INDEX',
		'GL_CULL_FACE',
		'GL_DEPTH_BUFFER_BIT',
		'GL_DEPTH_COMPONENT',
		'GL_DOUBLE',
		'GL_FLAT',
		'GL_FLOAT',
		'GL_FRONT',
		'GL_GREEN',
		'GL_INT',
		'GL_LINES',
		'GL_LINE_LOOP',
		'GL_LINE_STRIP',
		'GL_LUMINANCE',
		'GL_LUMINANCE_ALPHA',
		'GL_MODELVIEW',
		'GL_POINTS',
		'GL_POLYGON',
		'GL_PROJECTION',
		'GL_QUADS',
		'GL_QUAD_STRIP',
		'GL_RED',
		'GL_RGB',
		'GL_RGBA',
		'GL_SHORT',
		'GL_SMOOTH',
		'GL_STENCIL_INDEX',
		'GL_TEXTURE',
		'GL_TRIANGLES',
		'GL_TRIANGLE_FAN',
		'GL_TRIANGLE_STRIP',
		'GL_UNSIGNED_BYTE',
		'GL_UNSIGNED_INT',
		'GL_UNSIGNED_SHORT'
	],
	#category : #'GFCanvas-Deprecated'
}

{ #category : #'as yet unclassified' }
GFGLConstants class >> initAttribMask [
	GL_COLOR_BUFFER_BIT := 16r00004000.
	GL_DEPTH_BUFFER_BIT := 16r00000100.

]

{ #category : #'as yet unclassified' }
GFGLConstants class >> initBeginMode [
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

]

{ #category : #'as yet unclassified' }
GFGLConstants class >> initDataType [
	GL_BYTE                           := 16r1400.
	GL_UNSIGNED_BYTE                  := 16r1401.
	GL_SHORT                          := 16r1402.
	GL_UNSIGNED_SHORT                 := 16r1403.
	GL_INT                            := 16r1404.
	GL_UNSIGNED_INT                   := 16r1405.
	GL_FLOAT                          := 16r1406.
	GL_2_BYTES                        := 16r1407.
	GL_3_BYTES                        := 16r1408.
	GL_4_BYTES                        := 16r1409.
	GL_DOUBLE                         := 16r140A.
]

{ #category : #'as yet unclassified' }
GFGLConstants class >> initDrawBufferMode [
	GL_FRONT := 16r0404.
	GL_BACK  := 16r0405.

	GL_CULL_FACE := 16r0B44.

]

{ #category : #'as yet unclassified' }
GFGLConstants class >> initMatrixMode [
	GL_MODELVIEW  := 16r1700.
	GL_PROJECTION := 16r1701.
	GL_TEXTURE    := 16r1702.

]

{ #category : #'as yet unclassified' }
GFGLConstants class >> initPixelFormat [
	
	GL_COLOR_INDEX                    := 16r1900.
	GL_STENCIL_INDEX                  := 16r1901.
	GL_DEPTH_COMPONENT                := 16r1902.
	GL_RED                            := 16r1903.
	GL_GREEN                          := 16r1904.
	GL_BLUE                           := 16r1905.
	GL_ALPHA                          := 16r1906.
	GL_RGB                            := 16r1907.
	GL_RGBA                           := 16r1908.
	GL_LUMINANCE                      := 16r1909.
	GL_LUMINANCE_ALPHA                := 16r190A.
]

{ #category : #'as yet unclassified' }
GFGLConstants class >> initShadingMode [

	GL_FLAT   := 16r1D00.
	GL_SMOOTH := 16r1D01.


]

{ #category : #initialization }
GFGLConstants class >> initialize [
	self
		initAttribMask;
		initMatrixMode;
		initBeginMode;
		initShadingMode;
		initDrawBufferMode;
		initPixelFormat;
		initDataType.

]
