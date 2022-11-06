Class {
	#name : #GFSDLCanvasEventHandler,
	#superclass : #OSWindowEventVisitor,
	#instVars : [
		'canvas'
	],
	#category : #'GFCanvas-Deprecated'
}

{ #category : #accessing }
GFSDLCanvasEventHandler >> canvas [

	^ canvas
]

{ #category : #accessing }
GFSDLCanvasEventHandler >> canvas: anObject [

	canvas := anObject
]

{ #category : #visiting }
GFSDLCanvasEventHandler >> visitWindowCloseEvent: anEvent [
	canvas onDestroyEvent
]

{ #category : #visiting }
GFSDLCanvasEventHandler >> visitWindowExposeEvent: anEvent [
	canvas onDrawEvent.
	anEvent suppressDefaultAction.
]

{ #category : #visiting }
GFSDLCanvasEventHandler >> visitWindowFrameEvent: anEvent [
	canvas
		ifNil: [ ^ self ];
		onUpdateEvent: Time millisecondClockValue * 0.001;
		onDrawEvent

]
