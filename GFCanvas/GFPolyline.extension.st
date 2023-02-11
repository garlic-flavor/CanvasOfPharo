Extension { #name : #GFPolyline }

{ #category : #'*GFCanvas' }
GFPolyline >> drawOn: canvas [
	canvas drawPolyline3: self
]
