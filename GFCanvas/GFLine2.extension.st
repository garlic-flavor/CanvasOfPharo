Extension { #name : #GFLine2 }

{ #category : #'*GFCanvas' }
GFLine2 >> drawOn: canvas [
	canvas moveTo: start.
	canvas lineTo: end.
]
