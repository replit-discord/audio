module github.com/replit/audio

go 1.14

replace github.com/replit/audio/opus => ./opus

replace github.com/replit/audio/gosamplerate => ./gosamplerate

require (
	github.com/replit/audio/gosamplerate v1.0.0
	github.com/replit/audio/opus v1.0.0
)
