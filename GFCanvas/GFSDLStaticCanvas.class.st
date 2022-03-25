Class {
	#name : #GFSDLStaticCanvas,
	#superclass : #Object,
	#instVars : [
		'window',
		'renderer'
	],
	#pools : [
		'SDL2Constants'
	],
	#category : #GFCanvas
}

{ #category : #'initialize-release' }
GFSDLStaticCanvas >> close [
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
GFSDLStaticCanvas >> createEventHandler [
	^ GFSDLCanvasEventHandler new
		canvas: self;
		yourself.
]

{ #category : #'instance creation' }
GFSDLStaticCanvas >> open [
	SDL2 initVideo.
	window := SDL2 createWindow: 'GFTest'
		x: SDL_WINDOWPOS_UNDEFINED
		y: SDL_WINDOWPOS_UNDEFINED
		width: 640
		height: 480
		flags: SDL_WINDOW_SHOWN.
	renderer := window createDefaultRenderer.
	renderer
		drawColorR: 255 g: 255 b: 255 a: 255;
		clear;
		drawColorR: 0 g: 255 b: 0 a: 255;
		drawPointX: 10 y: 10;
		drawLineX1: 30 y1: 30 x2: 500 y2: 30;
		present.

]

{ #category : #accessing }
GFSDLStaticCanvas >> renderer [

	^ renderer
]

{ #category : #accessing }
GFSDLStaticCanvas >> renderer: anObject [

	renderer := anObject
]

{ #category : #accessing }
GFSDLStaticCanvas >> window [

	^ window
]

{ #category : #accessing }
GFSDLStaticCanvas >> window: anObject [

	window := anObject
]
