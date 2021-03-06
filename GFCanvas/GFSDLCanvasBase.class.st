Class {
	#name : #GFSDLCanvasBase,
	#superclass : #GFNativeCanvasBase,
	#category : #'GFCanvas-SDL'
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
		rmask: 16r000000ff
		gmask: 16r0000ff00
		bmask: 16r00ff0000
		amask: 16r00000000)
		autoRelease;
		yourself
]

{ #category : #drawing }
GFSDLCanvasBase >> clear [
	renderer
		color: self paper color;
		clear

]

{ #category : #'path commands' }
GFSDLCanvasBase >> drawLines: vertices [
	|prev curr|
	vertices isEmptyOrNil ifTrue: [ ^ self ].
	renderer color: self pen color.
	prev := vertices first + self pen pos.
	vertices allButFirst do: [ :vert |
		curr := vert + self pen pos.
		renderer drawLine: prev end: curr.
		prev := curr.
	]

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

{ #category : #'path commands' }
GFSDLCanvasBase >> lineTo: pos [
	renderer
		color: self pen color;
		drawLine: self pen pos end: pos.
	self pen pos: pos
]

{ #category : #rendering }
GFSDLCanvasBase >> present [
	renderer present
]
