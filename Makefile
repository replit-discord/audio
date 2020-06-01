CWD=$(shell pwd)
SAMPLERATE_LIB_DIR="$(CWD)/gosamplerate/lib"
ALSA_LIB_DIR="$(CWD)/oto/lib"
OPUS_LIB_DIR="$(CWD)/opus/lib"
OPUSFILE_LIB_DIR="$(CWD)/opus/lib/opusfile"
OGG_LIB_DIR="$(CWD)/opus/lib/ogg"
URL_LIB_DIR="$(CWD)/opus/lib/url"
LIBSAMPLERATE_FILES=./gosamplerate/lib/libsamplerate.a ./gosamplerate/lib/samplerate.h

.PHONY: build
build: $(LIBSAMPLERATE_FILES) ./opus/lib ## Build the required c libraries. This can take a while.

$(LIBSAMPLERATE_FILES): 
	@echo "Installing libsamplerate"
	@./scripts/install_libsamplerate

./opus/lib: ## Build and install opusfile and its dependancies
	@echo "Installing libopus and libopusfile"
	@./scripts/install_opus

.PHONY: rebuild
rebuild: clean build ## This may take a while.

.PHONY: rebuild-all
rebuild-all: clean-all build ## This rebuilds EVERYTHING, and can take quite a while.
	cd /tmp && rm -r opus-1.3.1 \
		opusfile-0.9 \
		opusfile.tar.gz \
		opus.tar.gz \
		libogg-1.3.4 \
		libogg.tar.gz \
		libsamplerate-0.1.9 \
		libsamplerate.tar.gz \
		openssl-1.1.1g \
		openssl.tar.gz



.PHONY: clean-all
clean-all: 
	rm -r 

.PHONY: clean
clean: ## Remove c libraries
	@-rm -r ./opus/lib ./gosamplerate/lib

audio: ./opus/lib $(LIBSAMPLERATE_FILES) ./* ./*/*
	go build audio.go

.PHONY: check
check: main
	ldd main
