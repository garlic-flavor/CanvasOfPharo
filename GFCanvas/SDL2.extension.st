Extension { #name : #SDL2 }

{ #category : #'*GFCanvas' }
SDL2 class >> calloc: nmemb size: size [
	^ self ffiCall: #( void* SDL_calloc ( size_t nmemb, size_t size ) )
]

{ #category : #'*GFCanvas' }
SDL2 class >> createRGBSurface: flags width: width height: height depth: depth rmask: rm gmask: gm bmask: bm amask: am [
	^ self ffiCall: #(SDL_Surface* SDL_CreateRGBSurface(
		uint flags, int width, int height, int depth, uint rm, uint gm, uint bm, uint am))
]

{ #category : #'*GFCanvas' }
SDL2 class >> free: ptr [
	^ self ffiCall: #( void SDL_free ( void* ptr ) )
]

{ #category : #'*GFCanvas' }
SDL2 class >> malloc: size [
	^ self ffiCall: #( void* SDL_malloc ( size_t size ) )
]

{ #category : #'*GFCanvas' }
SDL2 class >> memcpy: src to: dst size: size [
	^ self ffiCall: #( void* SDL_memcpy ( void* dst, void* src, size_t size ) )
]

{ #category : #'*GFCanvas' }
SDL2 class >> realloc: ptr size: size [
	^ self ffiCall: #( void* SDL_realloc ( void* ptr, size_t size ) )
]

{ #category : #'*GFCanvas' }
SDL2 class >> rwFromFile: file mode: mode [
	^ self ffiCall: #( SDL_RWops* SDL_RWFromFile( String file, String mode ) )
]
