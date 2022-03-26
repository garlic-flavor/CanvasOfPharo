Extension { #name : #SDL2 }

{ #category : #'*GFCanvas' }
SDL2 class >> createRGBSurface: flags width: width height: height depth: depth rmask: rm gmask: gm bmask: bm amask: am [
	^ self ffiCall: #(SDL_Surface* SDL_CreateRGBSurface(
		uint flags, int width, int height, int depth, uint rm, uint gm, uint bm, uint am))
]

{ #category : #'*GFCanvas' }
SDL2 class >> rwFromFile: file mode: mode [
	^ self ffiCall: #( SDL_RWops* SDL_RWFromFile( String file, String mode ) )
]
