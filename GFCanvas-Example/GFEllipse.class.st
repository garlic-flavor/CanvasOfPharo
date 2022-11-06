Class {
	#name : #GFEllipse,
	#superclass : #GFExample,
	#instVars : [
		'ovals'
	],
	#category : #'GFCanvas-Example'
}

{ #category : #'as yet unclassified' }
GFEllipse class >> typeA [
	^ self new
		ovals: {
			GFOvals new
				center: 320@240;
				radius: 240;
				yourself
		};
		open;
		yourself
]

{ #category : #'as yet unclassified' }
GFEllipse class >> typeB [
	^ self new
		ovals: {
			GFOvals new
				center: 220@240;
				radius: 220;
				yourself.
			GFOvals new
				center: 540@100;
				radius: 100;
				yourself.
			GFOvals new
				center: 540@300;
				radius: 90;
				yourself
			
		};
		open;
		yourself
]

{ #category : #'as yet unclassified' }
GFEllipse class >> typeC [
	^ self new
		ovals: {
			GFOvals new
				center: 200@240;
				radius: 200;
				yourself.
			GFOvals new
				center: 520@120;
				radius: 120;
				yourself.
			GFOvals new
				center: 520@340;
				radius: 80;
				yourself
			
		};
		open;
		yourself
]

{ #category : #'as yet unclassified' }
GFEllipse class >> typeD [
	^ self new
		ovals: {
			GFOvals new
				center: 180@240;
				radius: 180;
				yourself.
			GFOvals new
				center: 500@140;
				radius: 140;
				yourself.
			GFOvals new
				center: 500@360;
				radius: 60;
				yourself
			
		};
		open;
		yourself
]

{ #category : #'as yet unclassified' }
GFEllipse class >> typeE [
	^ self new
		ovals: {
			GFOvals new
				center: 160@160;
				radius: 160;
				yourself.
			GFOvals new
				center: 370@50;
				radius: 50;
				yourself.
			GFOvals new
				center: 480@50;
				radius: 40;
				yourself.
			GFOvals new
				center: 570 @ 50;
				radius: 30;
				yourself.
			GFOvals new
				center: 370@140;
				radius: 20;
				yourself.
		};
		open;
		yourself
]

{ #category : #accessing }
GFEllipse >> ovals [

	^ ovals ifNil: [
		ovals := OrderedCollection new
	]
]

{ #category : #accessing }
GFEllipse >> ovals: anObject [

	ovals := anObject
]

{ #category : #'as yet unclassified' }
GFEllipse >> ready [
	super ready.
	self ovals do: [ :each |
		self canvas add: each
	]

]
