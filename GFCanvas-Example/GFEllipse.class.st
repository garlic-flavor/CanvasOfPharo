Class {
	#name : #GFEllipse,
	#superclass : #GFExample,
	#category : #'GFCanvas-Example'
}

{ #category : #'as yet unclassified' }
GFEllipse >> ready [
	super ready.
	self canvas add: GFOvals new
]
