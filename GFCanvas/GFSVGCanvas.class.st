Class {
	#name : #GFSVGCanvas,
	#superclass : #GFCanvasBase,
	#instVars : [
		'width',
		'height',
		'nodes'
	],
	#category : #'GFCanvas-SVG'
}

{ #category : #utilities }
GFSVGCanvas class >> makeDfrom: v close: closing [
	|d first|
	d := String new writeStream.
	first := v first.
	d
		<< 'M ';
		<< first x value asInteger asString;
		<< ' ';
		<< first y value asInteger asString.
	v allButFirstDo: [ :one |
		d
			<< ' L ';
			<< one x value asInteger asString;
			<< ' ';
			<< one y value asInteger asString
	].
	closing ifTrue: [	d << ' z' ].
	^ d contents
]

{ #category : #'canvas drawing' }
GFSVGCanvas >> circle: radius [
	|x y w color fill|
	x := self pen pos x value asInteger asString.
	y := self pen pos y value asInteger asString.
	w := self pen width value asInteger asString.
	color := self pen color name asString.
	fill := self fillColor name asString.
	fill == 'transparent' ifTrue: [ fill := 'none' ].
	self nodes add: [ :svg |
		svg tag: 'circle' attributes: {
			'cx' -> x.
			'cy' -> y.
			'r' -> radius value asString.
			'fill' -> fill.
			'stroke' -> color.
			'stroke-width' -> w
		}
	]
]

{ #category : #'canvas drawing' }
GFSVGCanvas >> drawLines: vertices [
	|w color|
	vertices ifEmpty: [ ^ self ].
	w := self pen width value asInteger asString.
	color := self pen color name asString.
	self nodes add: [ :svg|
		svg tag: 'path' attributes: { 
			'd'	 -> (self class makeDfrom: vertices close: false).
			'stroke' -> color.
			'stroke-width' -> w.
			'fill' -> 'none'
		}.
	].
	self pen pos: vertices last
]

{ #category : #'canvas drawing' }
GFSVGCanvas >> drawPolygon: v [
	|w color fill|
	v ifEmpty: [ ^ self ].
	w := self pen width value asInteger asString.
	color := self pen color name asString.
	fill := self fillColor name asString.
	fill == 'transparent' ifTrue: [ fill := 'none' ].
	self nodes add: [ :svg|
		svg tag: 'path' attributes: { 
			'd'	 -> (self class makeDfrom: v close: true).
			'stroke' -> color.
			'stroke-width' -> w.
			'fill' -> fill
		}.
	].
	self pen pos: v last
]

{ #category : #'canvas drawing' }
GFSVGCanvas >> ellipse: radius flattening: flattening [
	|x y w color fill|
	x := self pen pos x value asInteger asString.
	y := self pen pos y value asInteger asString.
	w := self pen width value asInteger asString.
	color := self pen color name asString.
	fill := self fillColor name asString.
	fill == 'transparent' ifTrue: [ fill := 'none' ].
	self nodes add: [ :svg |
		svg tag: 'ellipse' attributes: {
			'cx' -> x.
			'cy' -> y.
			'rx' -> radius value asInteger asString.
			'ry' -> (radius value * flattening) asInteger asString.
			'stroke-width' -> w.
			'stroke' -> color.
			'fill' -> fill
		}
	]
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
			'width' -> ((GFUnit toMm: self paper width) asString, 'mm').
			'height' -> ((GFUnit toMm: self paper height) asString, 'mm').
			'viewBox' -> ('0 0 ', self paper width asString, ' ', self paper height asString).
			'xmlns' -> 'http://www.w3.org/2000/svg'.
			'version' -> '1.1'
		} with: [ :svg |
			self nodes do: [ :node | node value: svg ]
		];
		yourself.
	aFileRef writeStreamDo: [ :s | w printOn: s ].

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

{ #category : #'instance creation' }
GFSVGCanvas >> open [
	^ self export
]
