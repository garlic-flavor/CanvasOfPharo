Class {
	#name : #GFWall,
	#superclass : #Object,
	#instVars : [
		'canvas',
		'wall',
		'angle'
	],
	#category : #'GFCanvas-Example'
}

{ #category : #'instance creation' }
GFWall class >> new: paper angle: angle [
	^ self new
		canvas: ((GFMorphCanvas new: paper)
			focalLength: 50;
			from: ((GFVector3 z: 50)
				rotate: angle * Float pi / 180.0 axis: GFVector3 y;
				yourself) to: (GFVector3 x: 0 y: -10 z: 0);
			yourself);
		angle: angle;
		wall: ((GFChess new: 1 w: 80 h: 40)
			local: (GFMatrix4x4 translateX: -60 y: -20 z: 0);
			yourself);
		ready;
		yourself
]

{ #category : #'as yet unclassified' }
GFWall class >> open: paper angle: angle [
	^ (self new: paper angle: angle)
		open;
		yourself
]

{ #category : #accessing }
GFWall >> angle [

	^ angle ifNil: [ angle := 0 ]
]

{ #category : #accessing }
GFWall >> angle: anObject [

	angle := anObject
]

{ #category : #accessing }
GFWall >> canvas [

	^ canvas
]

{ #category : #accessing }
GFWall >> canvas: anObject [

	canvas := anObject
]

{ #category : #'initialize-release' }
GFWall >> close [
	self canvas close
]

{ #category : #'instance creation' }
GFWall >> open [
	self canvas open
]

{ #category : #'as yet unclassified' }
GFWall >> ready [
	self canvas add: self wall.
]

{ #category : #accessing }
GFWall >> wall [

	^ wall
]

{ #category : #accessing }
GFWall >> wall: anObject [

	wall := anObject
]
