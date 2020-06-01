CWD=$(shell pwd)
SAMPLERATE_LIB_DIR="$(CWD)/gosamplerate/lib"
ALSA_LIB_DIR="$(CWD)/oto/lib"
OPUS_LIB_DIR="$(CWD)/opus/lib"
OPUSFILE_LIB_DIR="$(CWD)/opus/lib/opusfile"
OGG_LIB_DIR="$(CWD)/opus/lib/ogg"
URL_LIB_DIR="$(CWD)/opus/lib/url"
export OGG_CFLAGS="$(CWD)/opus/lib/ogg"
export OGG_LIBS="$(CWD)/opus/lib/ogg"
export OPUSFILE_CFLAGS="$(CWD)/opus/lib/opusfile"
export OPUSFILE_LIBS="$(CWD)/opus/lib/opusfile"
export OPUS_CFLAGS="$(CWD)/opus/lib"
export OPUS_LIBS="$(CWD)/opus/lib"
export LIBOPUSENC_CFLAGS="$(CWD)/opus/lib/opusfile"
export LIBOPUSENC_LIBS="$(CWD)/opus/lib/opusfile" 
export FLAC_CFLAGS="$(CWD)/opus/lib/opusfile"
export FLAC_LIBS="$(CWD)/opus/lib/opusfile" 
export DEPS_CFLAGS=-I$(OPUS_LIB_DIR)/opus -I$(OGG_LIB_DIR)
export DEPS_LIBS=-L$(OPUS_LIB_DIR) -L$(OGG_LIB_DIR) -lopus -logg
export URL_DEPS_CFLAGS=-I(URL_LIB_DIR)
export URL_DEPS_LIBS=-L$(URL_LIB_DIR) -lssl

AUTOMAKE_FLAGS=--enable-static --enable-shared=no --quiet --
LIBSAMPLERATE_FILES=./gosamplerate/lib/libsamplerate.a ./gosamplerate/lib/samplerate.h

$(LIBSAMPLERATE_FILES): 
	@echo "Installing libsamplerate"
	@./scripts/install_libsamplerate

./opus/lib: ## Build and install opusfile and its dependancies
	@echo "Installing libopus and libopusfile"
	@./scripts/install_opus

audio: ./opus/lib $(LIBSAMPLERATE_FILES) ./* ./*/*
	go build audio.go

.PHONY: check
check: main
	ldd main
