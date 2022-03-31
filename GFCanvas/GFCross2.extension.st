Extension { #name : #GFCross2 }

{ #category : #'*GFCanvas' }
GFCross2 >> drawOn: canvas [
	|r|
	r := width / 2.
	canvas moveTo: (center - (r@r)).
	canvas lineTo: (center + (r@r)).
	canvas moveTo: (center + ((r * -1)@r)).
	canvas lineTo: (center + (r@(r * -1))).
	canvas moveTo: center.
]
