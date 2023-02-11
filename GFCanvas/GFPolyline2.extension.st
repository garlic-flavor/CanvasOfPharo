Extension { #name : #GFPolyline2 }

{ #category : #'*GFCanvas' }
GFPolyline2 >> drawOn: canvas [
	self indices pairsDo: [ :a :b |
		canvas
			moveTo: (self vertices at: a);
			lineTo: (self vertices at: b)
	]
]
