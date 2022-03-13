Class {
	#name : #BaselineOfGFCanvas,
	#superclass : #BaselineOf,
	#category : #BaselineOfGFCanvas
}

{ #category : #baselines }
BaselineOfGFCanvas >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec
				package: 'GFCanvas'
		]
]

{ #category : #accessing }
BaselineOfGFCanvas >> projectClass [
	^ MetacelloCypressBaselineProject
]
