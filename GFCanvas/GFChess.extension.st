Extension { #name : #GFChess }

{ #category : #'*GFCanvas' }
GFChess >> drawOn: canvas [
	self squares do: [ :square |
		self vertices: square.
		canvas drawSquare3: self
	]
]
