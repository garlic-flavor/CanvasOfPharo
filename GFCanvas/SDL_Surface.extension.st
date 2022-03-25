Extension { #name : #'SDL_Surface' }

{ #category : #'*GFCanvas' }
SDL_Surface >> saveBMP_RW: dst freedst: freedst [
	^ self ffiCall: #(int SDL_SaveBMP_RW ( self, SDL_RWops* dst, int freedst ) )
]
