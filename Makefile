CWD=$(shell pwd)
SAMPLERATE_LIB_DIR="$(CWD)/gosamplerate/lib"
ALSA_LIB_DIR="$(CWD)/oto/lib"
OPUS_LIB_DIR="$(CWD)/opus/lib"
OPUSFILE_LIB_DIR="$(CWD)/opus/lib/opusfile"
OGG_LIB_DIR="$(CWD)/opus/lib/ogg"
URL_LIB_DIR="$(CWD)/opus/lib/url"
LIBSAMPLERATE_FILES=./gosamplerate/lib/libsamplerate.a ./gosamplerate/lib/samplerate.h
OPUS_FILES=./opus/lib/opus.h ./opus/lib/opus_types.h ./opus/lib/libopus.a ./opus/lib/opus_defines.h ./opus/lib/opus_projection.h ./opus/lib/opus_multistream.h ./opus/lib/opus/opus.h ./opus/lib/opus/opus_types.h ./opus/lib/opus/opus_defines.h ./opus/lib/opus/opus_projection.h ./opus/lib/opus/opus_multistream.h ./opus/lib/ogg/libogg.a ./opus/lib/ogg/ogg/os_types.h ./opus/lib/ogg/ogg/ogg.h ./opus/lib/ogg/ogg/config_types.h ./opus/lib/opusfile/libopusurl.a ./opus/lib/opusfile/libopusfile.a ./opus/lib/opusfile/opus/opusfile.h

.PHONY: build
build: $(LIBSAMPLERATE_FILES) $(OPUS_FILES) ## Build the required c libraries. This can take a while.

$(LIBSAMPLERATE_FILES): 
	@echo "Installing libsamplerate"
	@./scripts/install_libsamplerate

$(OPUS_FILES): ## Build and install opusfile and its dependancies
	@echo "Installing libopus and libopusfile"
	@./scripts/install_opus

.PHONY: rebuild
rebuild: clean build ## This may take a while.

.PHONY: rebuild-all
rebuild-all: clean-all build ## This rebuilds EVERYTHING, and can take quite a while.
	

.PHONY: clean-all
clean-all: clean
	-@cd /tmp && rm -r opus-1.3.1 \
		opusfile-0.9 \
		opusfile.tar.gz \
		opus.tar.gz \
		libogg-1.3.4 \
		libogg.tar.gz \
		libsamplerate-0.1.9 \
		libsamplerate.tar.gz \
		openssl-1.1.1g \
		openssl.tar.gz >> /dev/null 2>&1

.PHONY: clean
clean: ## Remove c libraries
	-@rm -r ./opus/lib ./gosamplerate/lib >> /dev/null 2>&1

.PHONY: test
test: $(OPUS_FILES) $(LIBSAMPLERATE_FILES) ## As this is just intended to be the go bindings bundled with static executables this just tests if they're static.
	@cd tests && go run main.go

.PHONY: check
check: main
	ldd main
