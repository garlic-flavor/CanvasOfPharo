Extension { #name : #SDL2 }

{ #category : #'*GFCanvas' }
SDL2 class >> rwFromFile: file mode: mode [
	^ self ffiCall: #( SDL_RWops* SDL_RWFromFile( String file, String mode ) )
]
