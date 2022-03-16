Extension { #name : #Number }

{ #category : #'*GFCanvas' }
Number >> cm [
	^ GFUnit cm: self
]

{ #category : #'*GFCanvas' }
Number >> in [
	^ GFUnit in: self
]

{ #category : #'*GFCanvas' }
Number >> mm [
	^ GFUnit mm: self
]

{ #category : #'*GFCanvas' }
Number >> px [
	^ GFUnit px: self
]
