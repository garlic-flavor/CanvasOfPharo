Class {
	#name : #GFSDLCanvasBase,
	#superclass : #GFCanvasBase,
	#instVars : [
		'renderer',
		'window',
		'items'
	],
	#category : #GFCanvas
}

{ #category : #'as yet unclassified' }
GFSDLCanvasBase class >> chooseFile [
	^ UIManager default
		chooseForSaveFileReference: 'Save an image as BMP'
		extensions: { 'bmp' }
		path: ('screenshot', self identityHash asString, '.bmp')
	
]

{ #category : #'surface management' }
GFSDLCanvasBase class >> createSurface: size [
	^ (SDL2 createRGBSurface: 0
		width: size x height: size y depth: 24
		rmask: 16r00ff0000
		gmask: 16r0000ff00
		bmask: 16r000000ff
		amask: 16r00000000)
		autoRelease;
		yourself
]

{ #category : #factory }
GFSDLCanvasBase >> createEventHandler [
	^ GFSDLCanvasEventHandler new
		canvas: self;
		yourself
]

{ #category : #'as yet unclassified' }
GFSDLCanvasBase >> export [
	|reference surface texture rw|
	reference := self class chooseFile.
	reference ifNil: [ ^ self ].
	surface := self class createSurface: window extent.
	texture := renderer getOrCreateRenderTargetTextureFor: #save withExtent: window extent.
	renderer withRenderTarget: texture do: [
		self redraw.
		renderer readPixels: nil format: surface format format pixels: surface pixels pitch: surface pitch.
	].
	rw := SDL2 rwFromFile: reference fullName mode: 'wb'.
	surface saveBMP_RW: rw freedst: 1.

]

{ #category : #initialization }
GFSDLCanvasBase >> initializeWithRenderer [
]

{ #category : #accessing }
GFSDLCanvasBase >> items [

	^ items ifNil: [ items := OrderedCollection new ]
]

{ #category : #accessing }
GFSDLCanvasBase >> items: anObject [

	items := anObject
]

{ #category : #'as yet unclassified' }
GFSDLCanvasBase >> onDestroyEvent [
]

{ #category : #'instance creation' }
GFSDLCanvasBase >> open [
	^ self subclassResponsibility 
]

{ #category : #rendering }
GFSDLCanvasBase >> present [
	renderer present
]

{ #category : #drawing }
GFSDLCanvasBase >> redraw [
	renderer
		color: self paper color;
		clear;
		color: self pen color.
	self items do: [ :item | item drawOn: self ]

]

{ #category : #'instance creation' }
GFSDLCanvasBase >> redrawAndPresent [
	self
		redraw;
		present
]
