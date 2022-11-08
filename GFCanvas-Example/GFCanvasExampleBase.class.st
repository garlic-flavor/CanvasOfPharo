Class {
	#name : #GFCanvasExampleBase,
	#superclass : #Object,
	#instVars : [
		'canvas'
	],
	#classInstVars : [
		'svgmode'
	],
	#category : #'GFCanvas-Example'
}

{ #category : #'instance creation' }
GFCanvasExampleBase class >> newCanvas [
	|svg|
	svg := svgmode.
	svgmode := nil.
	^ svg ifNotNil: [
		self newSVGCanvas
	] ifNil: [
		self newMorphCanvas
	]
]

{ #category : #'instance creation' }
GFCanvasExampleBase class >> newMorphCanvas [
	GFUnit dpi: 72.
	^ GFMorphCanvas new: GFPaper VGAyoko

]

{ #category : #'instance creation' }
GFCanvasExampleBase class >> newSVGCanvas [
	GFUnit dpi: 300.
	^ GFSVGCanvas new: GFPaper A4yoko
]

{ #category : #accessing }
GFCanvasExampleBase class >> svgmode [
	svgmode := true
]

{ #category : #tests }
GFCanvasExampleBase class >> test: no [
	|header|
	header := String streamContents: [ :s |
		s << $_; << (no asString padLeftTo: 4 with: $0)
	].
	self methodDict valuesDo: [ :val |
		(val selector beginsWith: header) ifTrue: [
			^ val valueWithReceiver: self new arguments: {  }.
		]
	]
]

{ #category : #accessing }
GFCanvasExampleBase >> canvas [

	^ canvas ifNil: [ canvas := self class newCanvas ]
]

{ #category : #accessing }
GFCanvasExampleBase >> canvas: anObject [

	canvas := anObject
]

{ #category : #'initialize-release' }
GFCanvasExampleBase >> close [
	canvas ifNil: [ ^ self ].
	canvas close.
	canvas := nil.
]

{ #category : #'as yet unclassified' }
GFCanvasExampleBase >> svgMode [
	self canvas: self class newSVGCanvas
]
