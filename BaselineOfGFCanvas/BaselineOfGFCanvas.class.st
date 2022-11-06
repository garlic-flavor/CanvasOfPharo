Class {
	#name : #BaselineOfGFCanvas,
	#superclass : #BaselineOf,
	#category : #BaselineOfGFCanvas
}

{ #category : #baselines }
BaselineOfGFCanvas >> baseline: spec [
	<baseline>
	spec
		for: #pharo
		do: [
			spec blessing: #baseline.
			self setUpDependencies: spec.

			spec
				package: 'GFCanvas';
				package: 'GFCanvas-Example' with: [ spec requires: #('GFCanvas') ]
		]
]

{ #category : #accessing }
BaselineOfGFCanvas >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #initialization }
BaselineOfGFCanvas >> setUpDependencies: spec [
	spec
		baseline: 'GFMatrix'
			with: [ spec repository: 'github://garlic-flavor/MatrixForPharo:master/repository' ];
		baseline: 'XMLParser'
			with: [ spec repository: 'github://pharo-contributions/XML-XMLParser/src' ]
]
