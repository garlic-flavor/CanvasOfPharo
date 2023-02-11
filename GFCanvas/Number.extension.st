Extension { #name : #Number }

{ #category : #'*GFCanvas' }
Number >> cm [
	^ GFUnit fromCm: self
]

{ #category : #'*GFCanvas' }
Number >> in [
	^ GFUnit fromInch: self
]

{ #category : #'*GFCanvas' }
Number >> mm [
	^ GFUnit fromMm: self
]

{ #category : #'*GFCanvas' }
Number >> px [
	^ self
]
