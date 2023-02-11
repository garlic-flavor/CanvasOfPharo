Class {
	#name : #GFRoomType1,
	#superclass : #Object,
	#instVars : [
		'tileSize',
		'width',
		'height',
		'depth',
		'local'
	],
	#category : #'GFCanvas-Deprecated'
}

{ #category : #'as yet unclassified' }
GFRoomType1 class >> size: s w: w h: h d: d [
	^ self new
		tileSize: s;
		width: w;
		height: h;
		depth: d;
		yourself.
]

{ #category : #accessing }
GFRoomType1 >> depth [

	^ depth
]

{ #category : #accessing }
GFRoomType1 >> depth: anObject [

	depth := anObject
]

{ #category : #drawing }
GFRoomType1 >> drawOn: canvas [
	canvas
		add: (GFPolyline3 grid: self tileSize w: self width h: self height);
		add: ((GFPolyline3 grid: self tileSize w: self depth h: self height)
			local: self local * (GFMatrix4x4 rotate: (Float halfPi * -1) axis: GFVector3 y);
			yourself);
		add: ((GFPolyline3 grid: self tileSize w: self width h: self depth)
			local: self local * (GFMatrix4x4 rotate: Float halfPi axis: GFVector3 x);
			yourself);
		add: ((GFPolyline3 grid: self tileSize w: self width h: self depth)
			local: self local * (GFMatrix4x4 translateX: 0 y: (self tileSize * self height) z: 0) * 
				(GFMatrix4x4 rotate: Float halfPi axis: GFVector3 x);
			yourself)
	
]

{ #category : #accessing }
GFRoomType1 >> height [

	^ height
]

{ #category : #accessing }
GFRoomType1 >> height: anObject [

	height := anObject
]

{ #category : #accessing }
GFRoomType1 >> local [

	^ local ifNil: [ local := GFMatrix4x4 identity ]
]

{ #category : #accessing }
GFRoomType1 >> local: anObject [

	local := anObject
]

{ #category : #accessing }
GFRoomType1 >> tileSize [

	^ tileSize
]

{ #category : #accessing }
GFRoomType1 >> tileSize: anObject [

	tileSize := anObject
]

{ #category : #accessing }
GFRoomType1 >> width [

	^ width
]

{ #category : #accessing }
GFRoomType1 >> width: anObject [

	width := anObject
]
