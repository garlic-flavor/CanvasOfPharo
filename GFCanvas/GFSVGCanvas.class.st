Class {
	#name : #GFSVGCanvas,
	#superclass : #GFCanvasBase,
	#instVars : [
		'width',
		'height',
		'nodes'
	],
	#category : #GFCanvas
}

{ #category : #'canvas drawing' }
GFSVGCanvas >> drawLines: vertices [
	|d first w color|
	vertices ifEmpty: [ ^ self ].
	d := String new writeStream.
	first := vertices first.
	d
		<< 'M ';
		<< first x value asInteger asString;
		<< ' ';
		<< first y value asInteger asString.
	vertices allButFirstDo: [ :v |
		d
			<< ' L ';
			<< v x value asInteger asString;
			<< ' ';
			<< v y value asInteger asString
	].
	w := self pen width value asInteger asString.
	color := self pen color name asString.
	self nodes add: [ :svg|
		svg tag: 'path' attributes: { 
			'd'	 -> d contents.
			'stroke' -> color.
			'stroke-width' -> w.
			'fill' -> 'none'
		}.
	]
]

{ #category : #'canvas drawing' }
GFSVGCanvas >> drawSquare: v [

]

{ #category : #export }
GFSVGCanvas >> export [
	| reference |
	reference := UIManager default
		chooseForSaveFileReference: 'Save as SVG'
		extensions: { 'svg' }
		path: 'drawing.svg'.
	reference ifNotNil: [ self exportUsing: reference ]
]

{ #category : #export }
GFSVGCanvas >> exportUsing: aFileRef [
	|w|
	w := (XMLWriter new)
		enablePrettyPrinting;
		enablePlatformSpecificLineBreak;
		xml;
		tag: 'svg' attributes: {
			'width' -> (self width inMm asString, 'mm').
			'height' -> (self height inMm asString, 'mm').
			'viewBox' -> ('0 0 ', self width value asString, ' ', self height value asString).
			'xmlns' -> 'http://www.w3.org/2000/svg'.
			'version' -> '1.1'
		} with: [ :svg |
			self nodes do: [ :node | node value: svg ]
		];
		yourself.
	aFileRef writeStreamDo: [ :s | w printOn: s ].

]

{ #category : #accessing }
GFSVGCanvas >> height [

	^ height ifNil: [ height := 297 mm ]
]

{ #category : #accessing }
GFSVGCanvas >> height: anObject [

	height := anObject
]

{ #category : #'canvas drawing' }
GFSVGCanvas >> lineTo: pos [
	|x y w c|
	x := self pen pos x asString.
	y := self pen pos y asString.
	w := self pen width value asString.
	c := self pen color name asString.
	self nodes add: [ :svg |
		svg tag: 'line' attributes: {
			'x1' -> x.
			'y1' -> y.
			'x2' -> pos x asString.
			'y2' -> pos y asString.
			'stroke' -> c.
			'stroke-width' -> w.
		}
	].
	self pen pos: pos.
	
]

{ #category : #accessing }
GFSVGCanvas >> nodes [

	^ nodes ifNil: [ nodes := OrderedCollection new ]
]

{ #category : #accessing }
GFSVGCanvas >> nodes: anObject [

	nodes := anObject
]

{ #category : #accessing }
GFSVGCanvas >> width [

	^ width ifNil: [ width := 210 mm ]
]

{ #category : #accessing }
GFSVGCanvas >> width: anObject [

	width := anObject
]
