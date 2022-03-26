Extension { #name : #'SDL_Renderer' }

{ #category : #'*GFCanvas' }
SDL_Renderer >> readPixels: rect format: fmt pixels: pixels pitch: pitch [
	^ self ffiCall: #(int SDL_RenderReadPixels(
		self, SDL_Rect* rect, uint fmt, void* pixels, int pitch ) )
]
