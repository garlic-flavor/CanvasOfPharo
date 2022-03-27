Class {
	#name : #GFGLSimpleCanvas,
	#superclass : #Object,
	#instVars : [
		'window',
		'renderer',
		'context'
	],
	#pools : [
		'GFGLConstants',
		'SDL2Constants'
	],
	#category : #GFCanvas
}

{ #category : #'initialize-release' }
GFGLSimpleCanvas >> close [
	renderer ifNotNil: [
		renderer destroy.
		renderer := nil
	].
	window ifNotNil: [
		window destroy.
		window := nil
	]
]

{ #category : #factory }
GFGLSimpleCanvas >> createEventHandler [
	^ GFSDLCanvasEventHandler new
		canvas: self;
		yourself.
]

{ #category : #'instance creation' }
GFGLSimpleCanvas >> open [
	SDL2 initVideo.
	window := SDL2 createWindow: 'GFTest'
		x: SDL_WINDOWPOS_UNDEFINED
		y: SDL_WINDOWPOS_UNDEFINED
		width: 640
		height: 480
		flags: SDL_WINDOW_SHOWN | SDL_WINDOW_OPENGL.
	context := SDL2 glCreateContext: window.
	GFGL viewportX: 0 y: 0 w: 640 h: 480.
	GFGL clearColorR: 0.7 g: 0.7 b: 1.0 a: 1.0.
	GFGL clear: GL_COLOR_BUFFER_BIT.
	SDL2 glSwapWindow: window.
]

{ #category : #accessing }
GFGLSimpleCanvas >> renderer [

	^ renderer
]

{ #category : #accessing }
GFGLSimpleCanvas >> renderer: anObject [

	renderer := anObject
]

{ #category : #accessing }
GFGLSimpleCanvas >> window [

	^ window
]

{ #category : #accessing }
GFGLSimpleCanvas >> window: anObject [

	window := anObject
]
