Extension { #name : #Number }

{ #category : #'*GFCanvas' }
Number >> cm [
	^ GFUnit cm: self
]

{ #category : #'*GFCanvas' }
Number >> cm: dpi [
	^ GFUnit cm: self dpi: dpi
]

{ #category : #'*GFCanvas' }
Number >> in [
	^ GFUnit in: self
]

{ #category : #'*GFCanvas' }
Number >> inch: dpi [
	^ GFUnit in: self dpi: dpi
]

{ #category : #'*GFCanvas' }
Number >> mm [
	^ GFUnit mm: self
]

{ #category : #'*GFCanvas' }
Number >> mm: dpi [
	^ GFUnit mm: self dpi: dpi
]

{ #category : #'*GFCanvas' }
Number >> px [
	^ GFUnit px: self
]

{ #category : #'*GFCanvas' }
Number >> px: dpi [
	^ GFUnit px: self dpi: dpi
]
